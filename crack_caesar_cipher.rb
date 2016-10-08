def crack_caesar_cipher cipher
	start = Time.now
	alphabet = ("a".."z").to_a
	i = 1
	while i<26
		letters = cipher.downcase.split("")
		letters.collect! do |letter|
			if /[A-Za-z]/.match(letter) != nil
				index = alphabet.index(letter)
				letter = alphabet[index-i]
			else
			letter
			end
		end
		puts "
		#{letters.join}
		"
		i+=1
	end
	end_time = Time.now
	puts "Operation took #{end_time-start} seconds"
end
crack_caesar_cipher("Ntpgh pvd, X phzts upqats sxgtri bpgztitg Ydt Hjvpgbpc pqdji iwt bdctn-qprz vjpgpcitt wt duutgts dc iwt hijuu wt hdas iwgdjvw bpvpoxct psh. Wt hpxs 10% du iwt etdeat lwd qdjvwi phzts udg iwtxg bdctn qprz... pcs xu pcn egdsjri sxeets qtadl 10%, wt's bpzt iwt rapxbh bdgt djigpvtdjh jcixa xi vdi qprz je. Wt idas bt iwpi iwxh lph p hltti hedi, hdbtlwtgt qtilttc pbpoxcv etdeat lxiw egdbxhth pcs sxhpeedxcixcv iwtb lxiw gtpaxin.

Iwpi'h dct epiw.

Iwt diwtg epiw xh iwt xchjgpcrt rdbepcn iwpi edxcih dji iwpi 99% du xih rjhidbtgh ldjas gtrdbbtcs iwtb--puitg uxaxcv p rapxb. Xbpvxct iwpi hipcspgs: stpaxcv lxiw iwt tbdixdch pcs uxcpcrxpa xbepri du pc xchjgpcrt rapxb, zcdlxcv iwpi ndj ctts id bpxcipxc p 99% staxvwi hipcspgs.

Iwpi'h iwt diwtg epiw.

Ndj rpc'i sd qdiw. Txiwtg ndj spooat lxiw ph bjrw wnet ph ndj rpc vti plpn lxiw, dg ndj xckthi xc staxvwixcv etdeat, gtvpgsathh du wdl sxuuxrjai xi xh.")