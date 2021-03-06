#!/bin/bash
:'This script finds the highest probability key length of a Vigenère Cipher.

'
shift_chars()
{
  inputStr=$@
  len=${#inputStr}

  #store the last character of the input into the first position
  shiftedStr="${inputStr:$len-1:1}"

  #offset every char to the right one
  for (( i=$len-2; i>=0; i-- ))
    do
      offset="${inputStr:$i:1}$offset"
    done

  shiftedStr="$shiftedStr$offset"
  echo "$shiftedStr"

}

######## Main script starts here ##########
originalInput="FIPJSEJXYVCYYHZKMOYHGNEYNXSYSIPHJOMOKLYYHBTXHMLIYIRGGKKPMFHJGMJRXGNOVTZHCSLZVBALZOVKZRHTWLBLGDJYGIWOHULMFZVVKXYDXUUNNRMRAMGZXKSXQRVNBBAIELOPBTZLFMRJETGBUCXRSIYKOPDCYYHRBTUOWAPRPKHMDLCMVVYDMSVCSIUGWHQSMOPRMTUNAYDEYOMAVITLMAUYPDJMCLVYUYYALDXBIDPXKQQMGZXKCPCPONTWJVSQPEAJPLBIMQESOGLDIVEYEKAPCWFZIFGGKLYAVPRYMVYXFZYTNISKMLHIEKMYSQFPABXXHXSBOPVZMSOWJPIXIKPCTDWEKKGDSKQPXGOGNFIPJGYULLDSFTWUKTKGLGNLJOZPDMQESOKIYOWSXIQCTZWEBPSSNTPBFSEAUOVOVSMVIQLTYWSPPEFZAVEKFTXJKKLCTSYJEUFMSPYXIAZLVPWGWOBXZSKWQSMFRBUORRSSHMAUYXMQESOGLXIQDMAGVJYVBLRPKPPDLFTWFZHJUMLRWJGLHCAFTXRGLARIRZTFUYARIULZRYMOKXZCSXKNWYRRSIAKBNRFMFVVTZIOEASSEZALCTCNOFUYZKMJELNZZSSRRPHVTMOOWSYPVMAAPEPLXFKTHPEAPLNHBAEEJWCFAIWBIQDIQGGKAYGPXRJPHCWRTPYRBNRXCOYCAGKOVRSIDATPXXUTKOETWKMPZJZUBZDFPTKUZXFOWRSEGOMTEWRSEIKVVCXRSIVXHDXIPTRLKTYCKMYIOELVWINLMAYMVNVGWPGUMOOGMXTBYXKKRBCIFKKCOHCITEKLZSSLZJGKESCSLDFNTDOOLYOEUKTSDLWNSYUNYSRFTWPNXLUWYYHUOLMKGCELBAZOVMLPHOUKLPIUEVNIXZYJYYBVKMFLYRAIENTWCXFPGBTYPNILEMNRUHMLCWSEIELBOQTRGKESCSLDFNTDDOVCAVVTVPZEJWCBIVBZMCOAVZAARIALVRYHMYXFPVCKHWVIYYHCKKOKTQDIPUGKRELOGNXXZVMIPWRIHUNLYYHPRHARIQNSZKXHCMJJSSLTUNSLNSZVELDMLRLVYKLCIKMPNTVLDSYXEACAVGEQDMGZBUQJMCLVYIVBXPLMGSKSYVPJHEUIWOHMQJGULSOINELRGKYSZYWSSNBZLVCLOSGLABSSDIQNBTKRBSIFGBKDSRSIQXTDOVYDLRSHCOHFTWPNTPBXMTXVCBZREANSZSHKKXGZRCXXWKVCOJBXTFYYLRPNJRDRSKLCPUFLRIPPEGGGFDMKPXBJTFCLCXELGLRPSPXVWGKCSWJZVEEHYCLCXELUGSIEQVJBXTNORRWIZGGMBSKEIYRLVXWZLRXVELKWCESYKMTOOLZALKLZSVRPPYYHUCFYYOVTEVXHMYWVXRLCCCDWVXPLRETPSSZXUDMKPWGNXOYRMFVGUXUDIPEEVTRVEVEPRGRXTORGYXUKBYDVYGIYRBUQFYNOJGKKCELOJBXPHBHQMIGCBEDPMYHBTTUNTYCMFYBYKZYDXQKTSYJRCEIKESSREDMEOGAOPJDSAGGKMSKAEAELOYYQPCRYPLKVCBYVZXHPVCYGUNHBCIYDARREHCELPRTRBZRSLPCRYLPBRMEQHIAPXXFPLNHBAYJQFGUZKHFIJWMAMRVEVQPPSOMOSRIDMETHAYJJLXREXHBWGEMFLBMDICYCRGKZCMLNIJKLPXGCTGNSXSKWRQVBSYYKRAP"

modifiedInput="FIPJSEJXYVCYYHZKMOYHGNEYNXSYSIPHJOMOKLYYHBTXHMLIYIRGGKKPMFHJGMJRXGNOVTZHCSLZVBALZOVKZRHTWLBLGDJYGIWOHULMFZVVKXYDXUUNNRMRAMGZXKSXQRVNBBAIELOPBTZLFMRJETGBUCXRSIYKOPDCYYHRBTUOWAPRPKHMDLCMVVYDMSVCSIUGWHQSMOPRMTUNAYDEYOMAVITLMAUYPDJMCLVYUYYALDXBIDPXKQQMGZXKCPCPONTWJVSQPEAJPLBIMQESOGLDIVEYEKAPCWFZIFGGKLYAVPRYMVYXFZYTNISKMLHIEKMYSQFPABXXHXSBOPVZMSOWJPIXIKPCTDWEKKGDSKQPXGOGNFIPJGYULLDSFTWUKTKGLGNLJOZPDMQESOKIYOWSXIQCTZWEBPSSNTPBFSEAUOVOVSMVIQLTYWSPPEFZAVEKFTXJKKLCTSYJEUFMSPYXIAZLVPWGWOBXZSKWQSMFRBUORRSSHMAUYXMQESOGLXIQDMAGVJYVBLRPKPPDLFTWFZHJUMLRWJGLHCAFTXRGLARIRZTFUYARIULZRYMOKXZCSXKNWYRRSIAKBNRFMFVVTZIOEASSEZALCTCNOFUYZKMJELNZZSSRRPHVTMOOWSYPVMAAPEPLXFKTHPEAPLNHBAEEJWCFAIWBIQDIQGGKAYGPXRJPHCWRTPYRBNRXCOYCAGKOVRSIDATPXXUTKOETWKMPZJZUBZDFPTKUZXFOWRSEGOMTEWRSEIKVVCXRSIVXHDXIPTRLKTYCKMYIOELVWINLMAYMVNVGWPGUMOOGMXTBYXKKRBCIFKKCOHCITEKLZSSLZJGKESCSLDFNTDOOLYOEUKTSDLWNSYUNYSRFTWPNXLUWYYHUOLMKGCELBAZOVMLPHOUKLPIUEVNIXZYJYYBVKMFLYRAIENTWCXFPGBTYPNILEMNRUHMLCWSEIELBOQTRGKESCSLDFNTDDOVCAVVTVPZEJWCBIVBZMCOAVZAARIALVRYHMYXFPVCKHWVIYYHCKKOKTQDIPUGKRELOGNXXZVMIPWRIHUNLYYHPRHARIQNSZKXHCMJJSSLTUNSLNSZVELDMLRLVYKLCIKMPNTVLDSYXEACAVGEQDMGZBUQJMCLVYIVBXPLMGSKSYVPJHEUIWOHMQJGULSOINELRGKYSZYWSSNBZLVCLOSGLABSSDIQNBTKRBSIFGBKDSRSIQXTDOVYDLRSHCOHFTWPNTPBXMTXVCBZREANSZSHKKXGZRCXXWKVCOJBXTFYYLRPNJRDRSKLCPUFLRIPPEGGGFDMKPXBJTFCLCXELGLRPSPXVWGKCSWJZVEEHYCLCXELUGSIEQVJBXTNORRWIZGGMBSKEIYRLVXWZLRXVELKWCESYKMTOOLZALKLZSVRPPYYHUCFYYOVTEVXHMYWVXRLCCCDWVXPLRETPSSZXUDMKPWGNXOYRMFVGUXUDIPEEVTRVEVEPRGRXTORGYXUKBYDVYGIYRBUQFYNOJGKKCELOJBXPHBHQMIGCBEDPMYHBTTUNTYCMFYBYKZYDXQKTSYJRCEIKESSREDMEOGAOPJDSAGGKMSKAEAELOYYQPCRYPLKVCBYVZXHPVCYGUNHBCIYDARREHCELPRTRBZRSLPCRYLPBRMEQHIAPXXFPLNHBAYJQFGUZKHFIJWMAMRVEVQPPSOMOSRIDMETHAYJJLXREXHBWGEMFLBMDICYCRGKZCMLNIJKLPXGCTGNSXSKWRQVBSYYKRAP"

size=${#originalInput}

#This example tests up to 40 keyspaces.
for i in {1..40}
  do
  count=0
  modifiedInput=$(shift_chars $modifiedInput)
	
    for (( j=0; j<$size; j++))
      do
        #compare the character at location "i" for the offset string and the original string
        if [ "${modifiedInput:$j:1}" = "${originalInput:$j:1}" ]
        then
          count=$((count + 1))
        fi
    done	
	
    echo "Key size $i has $count similarities"
  done

:'Sample Output
Key size 1 has 79 similarities
Key size 2 has 58 similarities
Key size 3 has 66 similarities
Key size 4 has 58 similarities
Key size 5 has 77 similarities
Key size 6 has 77 similarities
Key size 7 has 73 similarities
Key size 8 has 72 similarities
Key size 9 has 108 similarities
Key size 10 has 77 similarities
Key size 11 has 70 similarities
Key size 12 has 75 similarities
Key size 13 has 66 similarities
Key size 14 has 70 similarities
Key size 15 has 80 similarities
Key size 16 has 67 similarities
Key size 17 has 66 similarities
Key size 18 has 119 similarities
Key size 19 has 66 similarities
Key size 20 has 72 similarities
Key size 21 has 55 similarities
Key size 22 has 72 similarities
Key size 23 has 58 similarities
Key size 24 has 73 similarities
Key size 25 has 60 similarities
Key size 26 has 64 similarities
Key size 27 has 101 similarities
Key size 28 has 67 similarities
Key size 29 has 74 similarities
Key size 30 has 83 similarities
Key size 31 has 61 similarities
Key size 32 has 60 similarities
Key size 33 has 67 similarities
Key size 34 has 68 similarities
Key size 35 has 62 similarities
Key size 36 has 112 similarities
Key size 37 has 66 similarities
Key size 38 has 68 similarities
Key size 39 has 67 similarities
Key size 40 has 66 similarities

Conclusion: The key size is most likely 9.
'

