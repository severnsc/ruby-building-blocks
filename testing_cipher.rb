def crack_cipher cipher
	start = Time.now
	alphabet = ("a".."z").to_a
	characters_in_cipher = cipher.downcase.split("")
	a_swaps = []
	i_swaps = []
	i=0
	i_shift = 0
	while i_shift == 0
		if characters_in_cipher[i] == characters_in_cipher[0]
			if characters_in_cipher[1] == " "
				i_shift = alphabet.index(characters_in_cipher[i]) - 8
				a_shift = alphabet.index(characters_in_cipher[i])
			end
		elsif characters_in_cipher[i-1] == " " && characters_in_cipher[i+1] == " "
			i_shift = alphabet.index(characters_in_cipher[i])-8
			a_shift = alphabet.index(characters_in_cipher[i])
		end
		i+=1
	end
	puts i_shift
	puts a_shift
	j = 0
	characters_in_cipher.each do |character|
		if /[a-z]/.match(character) != nil
			i_sub = alphabet.index(character)-i_shift
			i_swaps.push(alphabet[i_sub])
			a_sub = alphabet.index(character)-a_shift
			a_swaps.push(alphabet[a_sub])
		else
			i_swaps.push(character)
			a_swaps.push(character)
		end
		j+=1
	end
	puts i_swaps.join("")
	puts a_swaps.join("")
	end_time = Time.now
	puts "Operation took #{end_time-start} seconds"
end
crack_cipher "Ntpgh pvd, X phzts upqats sxgtri bpgztitg Ydt Hjvpgbpc pqdji iwt bdctn-qprz vjpgpcitt wt duutgts dc iwt hijuu wt hdas iwgdjvw bpvpoxct psh. Wt hpxs 10% du iwt etdeat lwd qdjvwi phzts udg iwtxg bdctn qprz... pcs xu pcn egdsjri sxeets qtadl 10%, wt's bpzt iwt rapxbh bdgt djigpvtdjh jcixa xi vdi qprz je. Wt idas bt iwpi iwxh lph p hltti hedi, hdbtlwtgt qtilttc pbpoxcv etdeat lxiw egdbxhth pcs sxhpeedxcixcv iwtb lxiw gtpaxin.

Iwpi'h dct epiw.

Iwt diwtg epiw xh iwt xchjgpcrt rdbepcn iwpi edxcih dji iwpi 99% du xih rjhidbtgh ldjas gtrdbbtcs iwtb--puitg uxaxcv p rapxb. Xbpvxct iwpi hipcspgs: stpaxcv lxiw iwt tbdixdch pcs uxcpcrxpa xbepri du pc xchjgpcrt rapxb, zcdlxcv iwpi ndj ctts id bpxcipxc p 99% staxvwi hipcspgs.

Iwpi'h iwt diwtg epiw.

Ndj rpc'i sd qdiw. Txiwtg ndj spooat lxiw ph bjrw wnet ph ndj rpc vti plpn lxiw, dg ndj xckthi xc staxvwixcv etdeat, gtvpgsathh du wdl sxuuxrjai xi xh."