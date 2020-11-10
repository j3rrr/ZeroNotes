local _, ZN, L = ...

local ZBMImportString = "!WA:2!TZZwWTX11jieB3c70irfPAh7eVETPmGeiebOOSIuyAiiaLycjinaOErYaUa7fyxtGDxV7c(qYkZeo5d3zs9KY2MKAp9XWpY0pYhDyN2o1jDsQQh)t)5oC6hCM(NMot)RF4pYhPTP9CU37UybWckk5M(vHgUpUpo3Z986EUN7zvK6dPeBiNIJLA0uxAOwdPoK67MoBdBZnYMB(Bw4HvnTvj2zvQTMQTPL1jY2u)U3vXwvQSPztxDR9vA7QzApVLRUPHtm7TMVEDhI71)AR(g)YJb)2UHTUA5TSiYfZThhytz200(RhjsKOfDSuQrEQmTTBA9YAUUwox5cxydLgMP0nVWCBTaX2X0qPzUSZDHlBRuJnexQOJRITBSS6g6UXQwhU5OfBBxB9gnG2x4S2Ih)(zDHHnRsBBLh60UkzDIHBP21RRV5EvMAYsLRuQ8KflxKvE1RtuA6Qv0qPfXj22owKMnNr1j2UQKQqxq83(65NDHPxCwFyTGnbGvXslKF2zZ2gqMQwnv2IyVl2JsAMBmVXdCy3MeW81j702qGzX2tv35TABWkoJsZMwNuH9CzE9ZzQs(XhBVAMnB3YOesIIw1wrvVTZ3552rXqVLcsjUe93AA6PYAyAq2xfMKyzvWPSTdPMPHQZdikoKsU2eJgUApZ24B4eHEUSTu0nG(sph980K0rEgAk4Xt0BjfvAQ3WO6u5luoFXSQeNAp8oeBtPSMoosao6ydCceFJyVomOWWFYDuSRnlB8(oNjBttf1p2w3aeMABDMITAdYlXQ6Q0eiENH(LJvSwtfhh8PSabVg(WoTDivyfRLfy4eSm76CopRER1T6aGDv1b2znaUBXGITztEp4njdh063Lv4(vfYWCXVOrJUq0rtnUnNEs0k6ud6v09umQbYZlyQB4stxLlXQTl)EE1geRtw6TBRytKMUDZMs3ut3LSRnPbGGiX9bQBbYq61yZzrVkbyWtL1X02DxKismubAYooKM1zJsMYZVWNa3j2GO(n4eY53gieZQ3s3vB36W4mLUDTMKvFiWxbAUH70ajX0UAXjZnZILY0wxDVXlxuZ6ThR9nZ9LFaFy5kIVsvhslG9umnOGp6UUM1e8QNpsLFFzD1IJkDNSZTdQLEtDvxTNDV62Gsai2O4Qe9t4uJPXIWPx1stvmF(c2Bk0Y)z)tFjuj)ycn7zmGcJufWY66nIz98G4JPnryBipQ0K32202z1Tb7lCb7DrrvDUXJInXz8Zcv6YKMJmuTZ9Uf3fmsyVgd5oD2gnn3qBxDOtLmBBxJ8shBFxYMUPN2euUb6840ArOpte61PP3N1VIEWI(S0Nll2Xv3Po04PBQ0WXE(flp7mfYZayLAEcgr3bHzgeMwNyAB97k9MTvurcIu5Y03KME7QkcRyrbRywNGHctbnh0RAbZseULMjx(DzvW4YfloZ1UE5hWWjoX72rEO)WWWgQn9n(y6L91dmaZm2A0RGfqVk76KSRFv21Pyx)Dyx)kSRzzx)ASR5WRwNaGZKQVvBhxIkrDoDdn6S2OfrycSV)OJeU024RTTjzbCXLJNL5LyfFgu6eudjlpLIJli9MvXE5fNzKoVnsjSdGXwxZvPRGYwpGb(8gkvBsu14mrFvVObje3kYU1am0SfoEBgz46mlJMgXRKK)p0QCIysWp96si2xHySUKIHQ)lPaTcxIKRgXG1o8xttqHwYY2SH0e90WuKnT05wmlR3IinI01iU4tXt43DyOy99RknA3Wf)ztacJHKJlAElvDtBWesC5Htvha1WoYsjz9nPuhmh)rA6qKcdoyZ60kd1yE3X)c)N1j7s8gxYi7KlwEE6t)NJgY3dT0yRZ082UUGhxSPIDdswKXyLs6r8BKrgHzThw8fES4gO(3tDdBqGQaGTA0tvvJOa680V3XTnmNJaqwJUt06qfUMnA0KGnnhGfAzwJSfSqEBd15naRe1vad2AzX58UlaRykvcRI3v63N(d0O)qWWUdUy6KnBs)aRHYXFtcwPuc5s2o03xRRoSnAnDEJMBbn)e4AVsMWlsT2clN34FeGygTBvfW4FWQzAPS5ezbTcROqvzAPBeL(bpGbBPMS1VOV)Pb8WfkHVEgnJ1LyYkGSGeO9iTHoGnkwwe45QeqeGxvnWTivZnmK0DKmiOw3nO)ba1I(hcek6FeIjttFVQTiWY5TGI)9OFpRZTiixKFZILLkycsXMGAVeJ2ZEfL5xxrVjQiLI39IoTaAHO3ZfVSgmyT0BO5ciVIQKRPKHPRgiAcygEvqojQiWqSKb4nuCW2j5awSW(GyqIUjRwGpo5VvXYizf93bqmF8Ktwdz2HO17r)lau7k5rdhGMQ0Kn1HrdgKMMMRjbuljDyLmeznRlTfykxQMMc6IhWCLqbmgOpfn2(RRyRJtD2caRccD48mkAG86ShXX87tpvrDdR2UiwVtu67FC6pe9ErXH(bfzdDvox907W8cPPUbrdbbN3Q13KaaiDVoa7dS(IZWwktQe6zO0m5CyZb09ojui9h(a(sDSQDO)1NM(3Or)B1ON8p9S0H(fGKh3a3E8Bv00vjfrzlv6PPNXRu03T9y2NABPcxP)20NF)gedITEnU)Kuz6ltLOFr6xI7cQJ13iFHPMFr0bnU7SjL6uq(c5skTWStEB45I5Vw(cvYntPjZoB(EloFbwP0Vqm6hU5tTPV9xqgJHooCtyX6yvLeWKAGIzk5qv1valDbkh0xy6obSdZ9ryj5oAyYRibK00JYn(LYFWXE59CVlc4dgH5fagDzR2dHCTBtUASGwx75catsk2gl8uY7DHKAMTQQ4kMg(lxa27d0p)UeCveskyocAHolbR7mtUv8RRVvvgzeskWnpGyvAXEj(D1MhhuPl0b)HcURLuADqduYsr32jEVyycjvZy9UEamtwt6BnHKmO2uSmAaqUV2Glj3xHRVu6vKcTPOXhskn4rWfHLwFaTI1)r8LH(kb5e91bKMknWPE3Cu0PpGassz3AP1xkZkRWgUoVgAxrTEstsn34JLeP9mn(zmQBgh7tIesdQxy1HwxOfssHYaXg0IZ(chjhytqYwQuRDynySvgCTmftv5b3G0Jo46cQkDEgMms6b36dbqilAW1AO3mP0aRLP7Fyt)lgo)iXayibKt5gu6RDE2wc79Gpl86Zhgcp9kwtJuBTQcJ)Vqm6lsFPpHV2Wnelc6y983J1fvZsctBYvbpoKJDF6RgdwRbx46dXfvO)myXcyHc6pN(pGlKaw2JSQVLD2QhjH1XskLkvQeDzhKxP0eaO7zXfUcpV1GeDGgg6Qm8M3LB6y4uAWbattTFdMbDu3UpBC93mWEf0a4cU2XHaomArXd2RehsJfSAaW37(hkxJ19ooPt)7bs9pbyaV6zq69B(KtVH1U7q(WP4es9J8hcpqSK(JdlOhs6Oholb09oI0ToRv7V0MxjHSg3a0n8iWVgDyRHe7wKhSSznBOxZkUpP2Ldlp4GwDdUlk6z)XhZ6Z75LoUJty3f89Osln)ddSFz2ULtWJYw3rk7cV7lUVRTIHdStzEi1(WQSOhTjZV0kSN12rPPLMIOAwSfMmk)(1IYRBAaN3msvFuh3ZOnXXjPeJsNusL00vPVD(2ppLrehqX9Sx3JwRcUJyyf3X62xLE8msXa2ThWZ9XFPZjLb(d2tSwklD0XK4INLUGuM(41SjlSor848M5OdUEIWmbuy6exitcaybifEkEb7(HStzKPZzE7JmhFghBdavymIv58LIrrRNCw5wrrwDh2mYRoop8KytxTiRJl8zgn14PhAZidTvKDyvW53B7fq2mq97WaiwX(oa8WnTuclH3bUqWthIqGD6KsnG)Qc)Pa)zNbEh(Rk8NsMpTIfk2nshRp3q5Cu7KnswThV1HnL6E983kEiGPpokR)jt3Vd3E131mlaVRkl0FKiCsgsAS(GbPEClX9Bd3XwFlX9B7HobLpUfkFfq(moVlGOjV6ej8GwOn82En82jckdYfBYgLEcyVQvHnl7qCzwi(3OhhnwaIDFIxyNNXyABtdxTIS4IjpS1d9dCPi6Fp0XvV2ABLti6OvKfHhnmOXkUyHen64NCxN2vlYI3SZDwNEQDGx5bFDF(Tk8q2MbJWNOetwy2EwrCH7eNtwaWfNWtL11D0bZGAIq5wHO2GKTGPbXRamq6VYzONApr8dRa)9UNX6vWPrf2fECWQyvb9DScqoQPJrAoYo(nbM28OLwXrtbma35OGEiVuVGIt)UwNIvcgrr88oQX2)F2jHx)e(GPVjHhY6V9(8P8T5HtmclYJvqJ4613IMExUmfAQpBH5lKNEkBGMHTHfE2Ed7BfmAz7MFtKB6SHYwwdfaFfdXlDSUk9w8sJYIOALnaY1nTvS2(MIh23hSmJd)cbfiWbnS3mfkGlDZcrmRsb3yvRxieYl)b6pTdGXO79ccYGaBIy9YdIZioJcT39ZFqKFZO0FP8Wg0)dgxG(Fs)U0)l6VI(F)TpiYXICqKi00he54ha1CQdI8zoiYtXiuhe5PpiYZCqKFJx6yhej2brE2dI8C0FXbr(S7YNiZMF6YHG5gEy(5oiYjFHdImemaFUv5yrin3XV5ik68yJI02HGH7nZuZxOc)mTcIf0)YXOK1P)XA0)en6FMg9hRr)rNM(xDC6F3XP)lrFitvmBtqThJ0AMjZLR3yRRSPgDNpAioZntGddO6mfWZcW6eDcY9ICx8)OD8nbaKZU89aG2UItvWt6CxbG9ExwxD77KDoPSk2o77D(lCBm0BT36jEldNwZ(1342V1oSt3WrxLKfzmC4ioGlAEFdbmdtPLhUgT(QmRw4zyzO6RIYA0EmcbpYBtqxIUm9ZqFkrH6QQeJIfYFJ8fl2rPIUAuQcTk9ZcEsD2ISnLzDLohOWKQQGLSLVjrzTjb7kolVG5geB2JZru1vwMTphNLRP4MjLzJgBRAwHben6N7SGt2V8)AirKAKhRFyZ7DRCLYxEXfcpQ4pUqpwm)4RWDmogabPjRw1MSUoZsViyIyKe4haT)AStLJ1Ny8HEPV8LhD0lJB)uEwDJ1eBop29rawYcS2c0HVbzl0auay4WRzg8Sd9b2sYxJ402rgb24JD534IJNuuo)KWxW0Lx5fV0yJFXlJJrxBLcaiyYb80)EbRHT3cXUJb8vc8ShpFOyFkzi5MxQW8LLkp)ItD9)3GHGH4jaLWzT2nBYMSYDKlxg2W71YxEMcxB6Itox(LXJ7QOIUAz8iuWjfspRCz5K48Kbbb0QzB648KbT3Gdnge8Wn2zn)KbUljqogieWRLPPXtg0gNdneacy5ARZCt)jdExKdppGiGjOX3Y0q9jdKJXbPagE8d2rN)KbWmcgcdeECeWnWNmOLwMXoG(JQtcpTzEYbqZ3aykErol1rFtDfrHbu182KE479UtXW(TXaY3xi95bJan3WpRs01e(tP53YWCiU2AqlzrHtsC(WjfbwRtGm8H5sZKBLGrRN9oyz7E3)QbpKa2r12tZ4nGVLc2PQemM98IRbZWge1qQb9rew9Hesv4eeJwbEdWez5Gv65Mpo3Hg5rgyrtHh(t2gN8Eg7p2r9ADbL1vA22R7PzHHkyTEBeCGnWf8oTPO2m9vBpBlFqnJZPGQfp0B9IqDZUH1n2fV4OJ2fwWzUifu8eoBdiHZw(aUv4gvMt3PwL3SnAB30yoyL)UihDImjto5QEBtve1C5xvMl60)bRZovqOFPt2xB758ieXVNf(tqftovk9qQhQbXcoS0LciX6hIyeJxc0VqXr7gd(i4dzJWb1Q0iBYbm8auEdy)fyzjLWzGSS)w1f5la4gjRlOG2ys9VjCXgx9FpURj)KRJlp6MWKvagVrjDY0jWqKK(nsCHmJpEYJA)YKmZtu)gl5yb7xmVuBqVE8qMGxkXaNHh9jiGOpU44fFC7Y4jVKOldI3lIFzO2t58yueUsxNTwNgeuiEDpJCStk9QbkpmRC9JkOlybrdVicpYiyaLdZtn0iBcwaFfsxEY4qhMXb8cFEJznvGnYexgpHFzbxdT)v5APUbwwk8q)sH7FbTIXQo(DkKtXvb2JaRL(VLc2yc2WedkctOvgPjKLLc9itFeqT)tofb3e91Uqp8LboF7kgzENRSxcqiVYajfFlCA0DO09rPqAFOiLWzaMir6EkT1wf4lITiWnXhJlZt0u5e91sEAweYXSZsgc(jSlF37Ex5GKd)U5preLmbRPHGOIKDGP)e2OfmziedQCOGywDh3UYolRM68WohCiscgrtWDKOFXLqfGWtwgzaxPLIBnT4YdFpD1RaQ8ZKlvk5HVpaTWuf660k8osCUpnbgzuhhtGeuhNngn4dYRV03Cz7Lnw58VEFRxbye2Joyd6rXvK75WIrbS4Xd0qoNFWhPCW2kpjShMe(hRE)jiHibPa2ryhsnaT(6sNKWsELW6qCHyY3siNGJDxypR2e9oC9P8g6HGl0iW9P1nPl(sdRSYijqM4a6esCNXOePwqjlSWYMqHXdHteFPV59x58myoiGYcOrjGi2dcfF4n78VeGiMGPfw(tGmMoWHNQcpgWLto77uM7bhb21HckUCYaGaSAfZaB3a4Da6Z7yde9xto051HjS1JqHqmnuzaXEjeiqWdyCqhW(Hi5ugptVUvChyp8J(c4rjOuZq3gbvbbJgPgz47XAtqHLWYtMaB0bBoFHoPGr0zjF)qedAIvcKwjP7jTs8At4PLGqQ6q1Dhm1MPoYYRqDdhWT24mQ2GZzc8396OFL0JQLSZCnPVa99hqIuecpmSYouMctv4)NR8)9CLJK6)rBAImyw4ozPuzpS4aCwgJ9W4RbO4(WRNvq9wwS36LL6Fuou(spYrSTG2hqdrM8iaqtyGTl0jEfDdY2Gj4vo)rcqmEDya5DQHRa0ZkljoQZ1FnRZ0Htg3NsCeygSTXha987lyDqAejCBEE1EOWjmH9hzw6DKQSxJb11nuJ3X93KcYcGVYhX5Bqxj4Ur4XYLNM9t(roDEKy9amcD0m0C)e)6HwpOo(PY6LWJdFBeD2(mMM2FJn6EJH8Yy7kyaLVKaIRCiCZyFAT5FVaCbWj5GUVh88E8XLKIhs67Ji0Lo(EI7qZt05(jcdbpsKtEQfhi6hSzXanCh2ETwc2e8ktSEOTNV)y865dSl5Js2x2f2gm6E9LJGbcxIxAE2DOx83irW4VGfkI1b80K22kBf(2AXQtkFf5UtsnpRO(DEP0RK4CxA0ZhsnzwjrpyKp0dIrwITolzTGIl(TfMiwyohJHmcpCT8xrQTdr6EyuIh9(idC22kJmEQrd0R6wkOfw54PgjHSuQu(GoqBAQ44ciLQFCmelGKucSDutXcJGnhZUcZoicZKsImiAdnDaTCckUGbnfZ6CwCZX(JzGUCibaQFDhO1jcpylDWrY57ih9iWrVE1DoOH7S3dCFLjKEvrh7gb7gMy8g7gydYwR)mONmEJvDpcbcBv(NQzAwulwsEnYwYEsY3pzxNJlo5ckY0exnss3L0kqcQkIOzT222yIMccg6CvBS1j6Hv51QjMGbMb(DZ1v2t3R6OOnSiJ6LFT7OAwHN(eRspXzpiskRX6kfcMVRuiORehysD7RBABG5oWbrgvJLEnPfFwIRcme8ZHLSk)JfnhptRiA7zARdte2bVS71NV4m3z(cLNCwQ2x4S0)Xlrhk62EFws2IZ7Oi7yGIAZJFRZxaqYREPDzhbc7d7jl(PUbi(brUW(8sXwAqAwDoqwGyVTLTPfW7X2STx6PUA27AA2kY7(A2MTDr3JP20Ar2t4FnAp)40F3nJ8((SW((qD61Pn2sDDTWfRKorOlMFSl5X2cLwL98NDy1ZN4(Yj9771kTy2k4cnjcVB6QI(SSXYgStczKrMjhBvwVJRClIBO99DENAqhGljgq12y12dO6(IRts5Htl3jg96tKo5Ldk8kOtbrEBx8CLa3YcoJTDrF2wsFLqvm99Y0pXW3VN8gd)WKpiYxK(rpS7eBJ(Ryjitm6NdeCYSk9dT0MQYuAkUONZPW89dfsyjlZCehhLge()9de)1Vt(IZJgWF9eXIjCmSt4Z9vaRCTLK9lwEfmTn8Y6s6jIrpzHZsh6J9)2bWVxa8Bh4Nq)P8pkSiVNNiMKxUSBXgF(XcNusimNe)ycvj2(N4fVvtmHShA2JTB87re5DtixGSb7JkQFJgDi(KAytMqwomJkD(OZ6CGuEapNPbXBa6d(9F(ct03y(OTIfCWdfR7TGuP6BtjHpt6X(iY4O)8ho11NSCL5kDTktMl38fyF5bVqm2Nh4lsFj6RgJ(Azum2ILU7Vyadg9NfH0sZtFt7YZVaMCyzXSjK2M(VhJ(gxs8zLF1oFq5037073DopsNL(92TtUy(DEoRxn0rR7ucnk9PJzlYqZdICw(xmUSU6dWeARiPgrhmltjX8sESNjc9w792kx7TDDMBQ7SrRdImcl5YSELbpyEz54E9MQPuTybYRFEA6YZR)(k5e9wY2Ez35brE2Hw)F(w)pd"
local ZBMWagoUrl = "https://wago.io/ssH2QdjlK"
local ZNDImportString = "!WA:2!TMXsZTTXzjZXntWKo1wjXPjXTfb2YM0MKHs2sXrnSjIpKetOOuiPSCILmjiWcsydbGSaupSSttvZ0XTP9q9XEu9AoP)aTto0EDhn9xGNPx6HoDY0d9y)2DbbjibPuJR0mca7(9A3V3FA8BpHt5BKmvYzNyRjuNq9jx84gYkpqfBzN1YWc)HrIez1iPsoZZAyHvr4mEBAFUmg6p8HYyvXQwwgU62hl32TLfEfBxDlthHgC4BDi)zE1Mi7Zx5ZAlJrIl02WqC9w6UOJKnvaKw1s30Tr28LQMVShcv0Fi6ShXFNljJp(4ro01szBe2byXpC8A)(YokYgOiyzfgtNTSJRm2viJUPURqdn4HtlHdCX6nBci9gxb796V6qvuJ2AAv3ZgHxkFXvxyTIzCHpkl3glp9bo2idJcQocpZPDd02it3ka067EuTSZxPATkvNVCv)TwfJGTkxz18flMPnW5g2gY7HWLz72yjKSHBRYMYBHCeEABtprqaV3kAAoi3L(aL)1F)lgBSZ8TWDacBkBCB(bCLdXOMWtQqwUj2QT9tDqgAS7kIGKUQ9RNs8tlLtmH4NIWwILSCrI50DOCVHILPMEtHJ0WaFR4ILDLJ8T8l7fOlrjAJkzlNpFj8UEcYF(RSoZAJn2yt3wx9Op8o6VZNTZclRTqJVHRf4q9IhcN7YmbdooYM6BjtV7NLCUfiVwgtlt03GKDOSez20T1lCSkCJsHOg9(f7Gajt15akmuzGCZmBjRBc4sUjzMxGml5Di3cEDI(x5qkE6CBRmgwYQZMb0skxO8wTbRpHYkgYooxGKwiJdy5qFXZ4PGji1rMq5Ap5YWDORHUjCuwRAXcLYtsU0F6FEZ)dCKh7iv(fxv0UUstQCOsBhxRTOFT7zowRTjZalAmbr4hdlWQt0f2tmTOKeBnDnrtlxrQ5tnK52j53)jBPRIeDBHmza5biOZa1byulkBQ29RKkTX4mwoobrG(JpznlKd45GO4dnYu1)9tdpH3kc3iHWtnlSOE6PIlEPqGw1kaS9ZeFaVR(MjD13cni578J3LjatCrQUrmT)HDjqunqvHTIoCkhFiBbANyIHYrpfh9rsgjozOOcwYKsByknaSidNWjWjt1Hl5dJx9OC7)7oV35j7pyKBBSjJDDxuaa5yNwYQw78jCF6log5fjc2NRRr)A2QYUqis2JNbr2TOU5kRRR62kZ8WNKFa4XFHNQAvJJulY5Vc5JQ3G)1UNnEIellB2w2WyprfdKmMAbqDrqI7O72AoX3g32uCDK8dMhu3ovK3gPExjpNqhPnVRenYwzKcshI3t)E95RblvRA(7uvAZ0GBNGVHcnyEZ0U42iHEwTslRD4l6Vel9a1GkTPUr3LrfYLoLqVozWNcEU01wKjlsB21golgbxlS4OrLypKIlYakU4AfwfsXz6gJEnli4JDsxRMnnqCBAvpHT)Dt3xKMHHTMm1QJXaHejg84jMib9a2ZwWreweovD4GyyUzuVHcMvqkoXzgnX6eBlewqJJenWDw6aCdcFeubXWiWDE6PIfmWapyaYq22boLlIyCkASqoH(O0vKP(v(FKWJicd4J65t01mHNrQQvwG7pONRGyX764eWRcUp6c17Lk4rqiex95Ac5mJk9iLj3n4VsXLKInkmWbHWt2bkPPnZmZOnRCQuZLkfdSURjLStqeyJ)FFbWm6g0iQpIOB6TqVzm9Y9tpIwMT3Qbc3pCDUE7a57LwSVR3o3aSZDihooN2s3KYghOwlZMjHmzq0ROstMA6KAGlk8rRKAgww4OEm6TNnvSy9rdhUj1PMgqzym2ETa0YtEP7a6J5avdLU(xPCxyYecKx(ExH8kp5vEwBhunzJDGGG0qe1TppDHMiOOfDfAeTvmRFCGpFMd7rwOkCiIUj5IKF0tz1VwcIlnoufvrIKWr84YSAWAaorUTDoOtHztmf5niVjr8WS(vybXMzfVMHg5)yiANrfFkEmvG8zqDsXDhVMV9q0G6XUXoP((bIMgmIwqL8idAoqnr9wQv6HxfwO(X9dj9U0eTdtCdk8DLj6(drCHT8InpkPShqcipbszdh1oEBcKxLCHYkTqkpGSe51HMianausVYdQt(XKFc5scGPZFHPPRqejRbkuQYCRgYUIfTAsHPJ(NYEsrEFlo2Fu(szxznAtx8wAIl2DH8LYfxC1IZ)jW7LZVy(s1YvOY8zkMV)LZxITk1o475N(IXG4IfaGtMmzqJc(MIPHAN7J)DR4HLCPqUphYqWrgYM0dEHkxCSdKKHL3HtaQgtCq1s38zPf9Z3miyiwD38SAt1VZTVzPNhn5INH8gNHSEzAOuvQYJCPlqkA)p(UF9aAJUhpQSKoGSDI3rEkPVtxr8ZEQrF3rl3ONRaA7u3NDA3gnTS5E2NxM9EvEZVlBPI(6XSFZEA6QgpcBnBVxikKjxHCdEFLb7n8Dp5UfZOzz6AFUfW6pu8JBlRs7)vSAvY0cKFQ2ru)hiOoTL6wmNjA0oClYpJ22i59O)f7Tp8(vixTEgSSUADY7dFE7Y2WXEV6t7ImRFO7oW99EAWrREd(71pqZaTREdde8gif0bz8QE1BFhE92rixjdnZ6HA67Iuzfv)LVK9Lc92GAdvZgJu0PZeiI9BnCOu3ZuElDLw47do76A7bA8fQs((0bLibD0tlO2B8aK3(OO4fDMr5grvNTk56riXjjixEPpyTX(R0UHjx7kyVqH1ZqJzu)GDGMPxhlBFW6EVuwPZ8HICe)01DmnK5eirXvxzvMeC25wG42aCf0BVf51osf5OG1zJjIST9sSXwOiBk2abzv9AzGh3xvSXEIqUitqzawN6oICmNtuI1(aCI8YqenMu5DO3JNvJ8An4RHbnBoGxTM(bO9i)CSkstUTHB9m0rXy)YlrtkWyoK3QmIosbYtIaOt(1KFtlYxr(CYVZ(nP5yfPr8zqUd1dbZBkrL8BRdi8KltMNKHCwbs2ZqYT74)H(kHFWjg47)qvHbDgzRaUXEdvqOtvHP7PMW9z5ENl6KQxp2JLI7J7IvwltTcqAMyHJMUQhoByc9wslRmrcWZMMVSLxs49qUHI7JEKcRatPydzBw9N4HS9K7tToNl6DV3J386XMeKzPjNYd2odz4w9orHbRdEFSlu5KoubvVNySBrDhxON5ybYLo0MEjxECAFUKfHSOfiFiRfwwTxSwxHeyr(3czRLTLSBbtnRK0HC54IWZRQAzUmYXrUjIpRVOx9tZxELsRun)vJ1tdNuTxAPHmroj)gk7okg)Qi8QGGVm0D7(pEy1zZ1Y5I2jM)GJckTFX1DGPtnZsJMOGPtu(Gp9WZ7JERxpW(9wApDD65VnMMnWbzGuCJEJ4qkvwLJ0luFK7H6Drr6rvbvC0aRs9ekqhkQMScAJnOsOd8O0TRTCHkzR9XRLVs1cRuA55l)rsXOLxp1SpYvAGAP6LMEvu1NnuAX9ziacrp8RQmUjYfI9WAXFJnwRqIYqAa)LPYtTPMlfWZ4FxrF6Np0VXZh6385d9zE(qF2Np0FNNp0VLh6pM8YL8RFM1ie5TOnrXQBJwE9RlanqXQSU(ZYU08vRTCLfRnFUCRuccz8c)XU9(4vvNnlgbV354IkqWvtKrCWNWufH9NOchQ0q8cVqjsdmNywG00sLq7qdKinIXcdPKOGKwk4md9S)d2rcTD5UepNLjQddgG(jseYWPtpaBNdQbrP1aPyI1hT6hTWO0qZvn6Z9PGoIuc1Fy0GKLhkthKRPcSEiZ)gcy84bMwoB816MHCQ4xqx9U3Bd8gMBE9RglSbOZzVhlgKdHot5tEHUZxhijvc7OTgiTCSWgP)OhEpDunEZhr3uLn6O4sZjfB4y4DFspIj9eQUjx4KIlFCAX0EucstfKsko0MrmXRjoBkXRps84Q9G4fQ8m0X3))OGEVtnd7Bg(dBn()leUgBO1rfIoJAiE)(ROA0eMxD19dV6Q7VzStT8MUxIE6ktDuKOVYohnObkbnCVxfR20EJd4fSpBXoI5jZOGWhQgqyOMr0qUuAnaejsydwuUrPBoQtqp)FIs79(GoTP1V(uJwO6x)fysDH66gCexbMdxyemSSqbqAa3UtmKoFM2NI0B9))bJw4FnIc5sceerJ08RhJ0IpCHOKVKOtUpBOaZYB73BeaVp7VUVkPn0QozBA7S7gHSWfhZBGeZ8cS5n0Zaj6BLjgyLhs23Vv8VP3)3wK9A1Pb8VG8lGoZV17w6gp8DZPv62nixtG8l5DuVZx(sKdyDBtso(eB)3UZ)9d"
local ZNDWagoUrl = "https://wago.io/LjFE8wNMN"

local selectedTemplate = nil

ImpExpSidebar = ZNSidebarFrame.Subframes.ImpExp
ImpExpContent = ZNBodyFrame.Subframes.ImpExp

ImpExpSidebar.ImpExpPlayerDbButton = ZN.CreateGenericButton("ImpExpPlayerDbButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar, "TOPLEFT", 240, 30, 0, -30,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Playerspell DB", "CENTER",true )
ImpExpSidebar.ImpExpBossTemplateButton = ZN.CreateGenericButton("ImpExpBossTemplateButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar.ImpExpPlayerDbButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Boss Templates", "CENTER",true )
ImpExpSidebar.ImpExpGroupTemplateButton = ZN.CreateGenericButton("ImpExpBossTemplateButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar.ImpExpBossTemplateButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Group Templates", "CENTER",true )
ImpExpSidebar.ImpExpBossWeakaurasButton = ZN.CreateGenericButton("ImpExpBossWeakaurasButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar.ImpExpGroupTemplateButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Weakauras", "CENTER",true )

ImpExpContent.ImpExpInfoSubframe = ZN.createSubFrame("ImpExpInfoSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","HIGH", false, 0, 0)
ImpExpContent.PlayerDbSubframe = ZN.createSubFrame("PlayerDbSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
ImpExpContent.BossTemplateSubframe = ZN.createSubFrame("BossTemplateSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
ImpExpContent.GroupTemplateSubframe = ZN.createSubFrame("GroupTemplateSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
ImpExpContent.WeakaurasSubframe = ZN.createSubFrame("WeakaurasSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)

ImpExpSidebar.ImpExpPlayerDbButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.PlayerDbSubframe") end)
ImpExpSidebar.ImpExpBossTemplateButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.BossTemplateSubframe") end)
ImpExpSidebar.ImpExpGroupTemplateButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.GroupTemplateSubframe") end)
ImpExpSidebar.ImpExpBossWeakaurasButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.WeakaurasSubframe") end)
--[[ ##############################################################################
  Imp / Exp Info
############################################################################## --]]
ImpExpInfoSubframe = ImpExpContent.ImpExpInfoSubframe
ImpExpInfoSubframe.UrlButton = ZN.CreateGenericButton("HomeUrlButton", ImpExpInfoSubframe, "BOTTOM", ImpExpInfoSubframe, "BOTTOM", 640, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "www.zero-wow.de", "CENTER",false )
ImpExpInfoSubframe.UrlButton:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)
ImpExpInfoSubframe.MainTitle = ZN.CreateText(ImpExpInfoSubframe, "TOP", ImpExpInfoSubframe, "TOP", 680, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, "Import / Export", "LEFT", "TOP")
ImpExpInfoSubframe.MainIntro = ZN.CreateText(ImpExpInfoSubframe, "TOP", ImpExpInfoSubframe.MainTitle, "BOTTOM", 680, 300, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"Here you can import Boss Templates and Spell Setups or export yours to share with others.\n\n"
.."|cff"..ZN.Colors.chatYell.."Warning:|r Importing a new Playerspell DB will override your current DB!\n\n"
.."If you want to extend the usage of your notes or you / member of your raid don't use ExRT have a look at the Weakauras Tab."
, "LEFT", "TOP",8)
--[[ ##############################################################################
  Player DB Imp / Exp
############################################################################## --]]
PlayerDbSubframe = ImpExpContent.PlayerDbSubframe
PlayerDbSubframe.EditBox = ZN.MultiLineEditBox("PlayerDbEditBox", PlayerDbSubframe, "TOP", PlayerDbSubframe, "TOP", 660, 450, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
PlayerDbSubframe.PlayerDbImportButton = ZN.CreateGenericButton("PlayerDbImportButton", PlayerDbSubframe, "BOTTOMRIGHT", PlayerDbSubframe.EditBox, "TOPRIGHT", 200, 30, 0, 10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Import Spell DB", "CENTER",true )
PlayerDbSubframe.PlayerDbExportButton = ZN.CreateGenericButton("PlayerDbExportButton", PlayerDbSubframe, "RIGHT", PlayerDbSubframe.PlayerDbImportButton, "LEFT", 200, 30, -10, 0,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Export Spell DB", "CENTER",true )
--Import Player DB Confirmation
ZNPlayerImportConfirmFrame = ZN.createSubFrame("ZNPlayerImportConfirmFrame",ZNFrame, 302, 202, ZN.Colors.ROWBG, 1, 'CENTER', 'TOOLTIP', true)
ZNPlayerImportConfirmFrame:SetScript("OnMouseDown", function(self, button)end)
table.insert(ZN.DropDownsEdit, ZNPlayerImportConfirmFrame)
ZNPlayerImportConfirmFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNPlayerImportConfirmFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZNPlayerImportConfirmFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);

ZNPlayerImportConfirmFrame.btnClose = ZN.CreateIconButton(ZNPlayerImportConfirmFrame, "TOPRIGHT", ZNPlayerImportConfirmFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNPlayerImportConfirmFrame.Title = ZN.CreateText(ZNPlayerImportConfirmFrame, "TOP", ZNPlayerImportConfirmFrame, "TOP", 150, 30, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 14, ZN.Colors.ACTIVE, "IMPORT PLAYER DB")
ZNPlayerImportConfirmFrame.Message = ZN.CreateText(ZNPlayerImportConfirmFrame, "TOP", ZNPlayerImportConfirmFrame, "TOP", 260, 60, 0, -40, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Importing will override your local Database\nAre you sure?", "CENTER")
ZNPlayerImportConfirmFrame.ConfirmButton = ZN.CreateGenericButton("ZNImportPlayerConfirmButton", ZNPlayerImportConfirmFrame, "BOTTOMLEFT", ZNPlayerImportConfirmFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Confirm", "CENTER",true, ZN.Colors.HD )
ZNPlayerImportConfirmFrame.CancelButton = ZN.CreateGenericButton("ZNImportPlayerCancelButton", ZNPlayerImportConfirmFrame, "BOTTOMRIGHT", ZNPlayerImportConfirmFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.HD )

ZNPlayerImportConfirmFrame.btnClose:SetScript("OnClick", function(self) ZNPlayerImportConfirmFrame:Hide() end)
ZNPlayerImportConfirmFrame.CancelButton:SetScript("OnClick", function(self) ZNPlayerImportConfirmFrame:Hide() end)
-- Import
ZNPlayerImportConfirmFrame.ConfirmButton:SetScript("OnClick", function(self) 
  local str = PlayerDbSubframe.EditBox.editbox:GetText() 
  if not str or str == "" then
    UIErrorsFrame:AddMessage("Insert Import String", 0.8, 0.07, 0.2, 5.0)
    return
  end
  local decstr = ZN:dec(str)
  ZNotes.PlayerSpells = loadstring(decstr)()  
  ZN:ReloadPlayerTable()
  ZN:Print("Imported Player DB")
  ZNPlayerImportConfirmFrame:Hide()
end)
-- Export
-- https://stackoverflow.com/questions/6075262/lua-table-tostringtablename-and-table-fromstringstringtable-functions
PlayerDbSubframe.PlayerDbExportButton:SetScript("OnClick", function(self) 
  local str = ZN:serializeTable(ZNotes.PlayerSpells, nil, true) 
  
  PlayerDbSubframe.EditBox.editbox:SetText(ZN:enc(str)) 
end)

PlayerDbSubframe.PlayerDbImportButton:SetScript("OnClick", function(self) 
  ZNPlayerImportConfirmFrame:SetShown(not ZNPlayerImportConfirmFrame:IsShown());
end)
--[[ ##############################################################################
  Boss Template Imp / Exp
############################################################################## --]]
-- Import
BossTemplateSubframe.ImportEditBox = ZN.MultiLineEditBox("TemplateImportEditBox", BossTemplateSubframe, "BOTTOM", BossTemplateSubframe, "BOTTOM", 660, 180, 0, 15, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
BossTemplateSubframe.ImportNameTextBox = ZN.SingleLineEditBox("ImportNameTextBox", BossTemplateSubframe, "BOTTOMLEFT", BossTemplateSubframe.ImportEditBox, "TOPLEFT", 400, 30, 0, 10, 10, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Enter Template Name", "LEFT")
BossTemplateSubframe.TemplateImportButton = ZN.CreateGenericButton("TemplateImportButton", BossTemplateSubframe, "BOTTOMRIGHT", BossTemplateSubframe.ImportEditBox, "TOPRIGHT", 200, 30, 0, 10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Import", "CENTER",true )

BossTemplateSubframe.TemplateImportButton:SetScript("OnClick", function(self) 
  local newTemplateName = BossTemplateSubframe.ImportNameTextBox:GetText()
  local encstr = BossTemplateSubframe.ImportEditBox.editbox:GetText()
  local decstr = ZN:dec(encstr)

  if newTemplateName == "Enter Template Name" or newTemplateName == "" then
    UIErrorsFrame:AddMessage("Please Enter a Name for your Template", 0.8, 0.07, 0.2, 5.0)    
    return
  end
  if encstr == "" then
    UIErrorsFrame:AddMessage("You need to insert an import string", 0.8, 0.07, 0.2, 5.0)
    return
  end

  ZNotes.BossTemplates[newTemplateName] = loadstring(decstr)()

  BossTemplateSubframe.ImportEditBox.editbox:SetText("|cff"..ZN.Colors.itemUncommon.."Template successfully imported as|r |cff"..ZN.Colors.chatInstance.."'"..newTemplateName.."'|r")
end)
-- Export
BossTemplateSubframe = ImpExpContent.BossTemplateSubframe
BossTemplateSubframe.ExportEditBox = ZN.MultiLineEditBox("TemplateExportEditBox", BossTemplateSubframe, "TOP", BossTemplateSubframe, "TOP", 660, 180, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
BossTemplateSubframe.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", BossTemplateSubframe, "BOTTOMLEFT", BossTemplateSubframe.ExportEditBox, "TOPLEFT", 240, 30, 0, 10,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Select Boss Template..", "LEFT",true )
BossTemplateSubframe.TemplateSelectButton.doOnUpdate = true
BossTemplateSubframe.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) selectedTemplate = newValue end
BossTemplateSubframe.TemplateExportButton = ZN.CreateGenericButton("TemplateExportButton", BossTemplateSubframe, "BOTTOMRIGHT", BossTemplateSubframe.ExportEditBox, "TOPRIGHT", 200, 30, 0, 10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Export", "CENTER",true )

BossTemplateSubframe.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.INACTIVE, "LEFT", 10) end)
BossTemplateSubframe.TemplateExportButton:SetScript("OnClick", function(self) 
  if selectedTemplate == nil or selectedTemplate == "Select Boss Template.." then
    ZN:Print("You need to select a Boss Template")
    return
  end
  local str = ZN:serializeTable(ZNotes.BossTemplates[selectedTemplate], nil, true) 
  
  BossTemplateSubframe.ExportEditBox.editbox:SetText(ZN:enc(str)) 
end)
--[[ ##############################################################################
  Weakauras
############################################################################## --]]
WeakaurasSubframe = ImpExpContent.WeakaurasSubframe
WeakaurasSubframe.Title = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe, "TOPLEFT", 680, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, "Zero Weakauras", "LEFT", "TOP")
WeakaurasSubframe.IntroText = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.Title, "BOTTOMLEFT", 680, 50, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE,
"There are two Weakauras to supplement ZeroNotes."
, "LEFT", "TOP", 8)
-- ZBM
WeakaurasSubframe.ZBMTitle = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.IntroText, "BOTTOMLEFT", 680, 30, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, "ZBM - Zero Boss Mods", "LEFT", "TOP")
WeakaurasSubframe.ZBMText = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.ZBMTitle, "BOTTOMLEFT", 680, 100, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE,
"The ZBM Weakaura will show bossmod-like bars for your note. You can choose whether you want to have bars for every assigned cooldown or only your own.\n\n"
.."Please visit wago.io for further information"
, "LEFT", "TOP", 8)
WeakaurasSubframe.ZBMImportStringButton = ZN.CreateGenericButton("ZBMImportStringButton", WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.ZBMText, "BOTTOMLEFT", 200, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "WA Import String", "CENTER",true )
WeakaurasSubframe.ZBMWagoButton = ZN.CreateGenericButton("ZBMWagoButton", WeakaurasSubframe, "LEFT", WeakaurasSubframe.ZBMImportStringButton, "RIGHT", 200, 30, 10, 0,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "wago.io", "CENTER",true )
-- ZBM Import Frame
WeakaurasSubframe.ZBMImportStringFrame = ZN.createSubFrame("ZBMImportStringFrame", WeakaurasSubframe, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
WeakaurasSubframe.ZBMImportStringFrame.btnClose = ZN.CreateIconButton(WeakaurasSubframe.ZBMImportStringFrame, "TOPRIGHT", WeakaurasSubframe.ZBMImportStringFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
WeakaurasSubframe.ZBMImportStringFrame.editbox = ZN.MultiLineEditBox("ZBMImportEditBoxFrame", WeakaurasSubframe.ZBMImportStringFrame, "TOP", WeakaurasSubframe.ZBMImportStringFrame, "TOP", 680, 450, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, ZBMImportString, "LEFT")
-- ZBM Wago Url Frame
ZBMWagoUrlFrame = ZN.createSubFrame("ZBMWagoUrlFrame",ZNFrame, 302, 152, ZN.Colors.ROWBG, 1, 'CENTER', 'TOOLTIP', true)
ZBMWagoUrlFrame:SetScript("OnMouseDown", function(self, button)end)
table.insert(ZN.DropDownsEdit, ZBMWagoUrlFrame)
ZBMWagoUrlFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZBMWagoUrlFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZBMWagoUrlFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
ZBMWagoUrlFrame.btnClose = ZN.CreateIconButton(ZBMWagoUrlFrame, "TOPRIGHT", ZBMWagoUrlFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZBMWagoUrlFrame.UrlBox = ZN.SingleLineEditBox("UrlBox", ZBMWagoUrlFrame, "CENTER", ZBMWagoUrlFrame, "CENTER", 250, 30, 0, 0, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, ZBMWagoUrl, "CENTER")
-- ZBM Button Functions
WeakaurasSubframe.ZBMImportStringFrame.btnClose:SetScript("OnClick", function(self) WeakaurasSubframe.ZBMImportStringFrame:Hide() end)
WeakaurasSubframe.ZBMImportStringButton:SetScript("OnClick", function(self) WeakaurasSubframe.ZBMImportStringFrame:Show() end)
WeakaurasSubframe.ZBMWagoButton:SetScript("OnClick", function(self) ZBMWagoUrlFrame:Show() end)
ZBMWagoUrlFrame.btnClose:SetScript("OnClick", function(self) ZBMWagoUrlFrame:Hide() end)
-- ZND
WeakaurasSubframe.ZNDTitle = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.ZBMImportStringButton, "BOTTOMLEFT", 680, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, "ZND - Zero Note Display", "LEFT", "TOP")
WeakaurasSubframe.ZNDText = ZN.CreateText(WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.ZNDTitle, "BOTTOMLEFT", 680, 100, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE,
"If you or members of your raid don't use ExRT, you can use the ZND Weakaura to show your notes on screen.\n\n"
.."Please visit wago.io for further information"
, "LEFT", "TOP", 8)
WeakaurasSubframe.ZNDImportStringButton = ZN.CreateGenericButton("ZBMImportStringButton", WeakaurasSubframe, "TOPLEFT", WeakaurasSubframe.ZNDText, "BOTTOMLEFT", 200, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "WA Import String", "CENTER",true )
WeakaurasSubframe.ZNDWagoButton = ZN.CreateGenericButton("ZBMWagoButton", WeakaurasSubframe, "LEFT", WeakaurasSubframe.ZNDImportStringButton, "RIGHT", 200, 30, 10, 0,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "wago.io", "CENTER",true )
-- ZND Import Frame
WeakaurasSubframe.ZNDImportStringFrame = ZN.createSubFrame("ZNDImportStringFrame", WeakaurasSubframe, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
WeakaurasSubframe.ZNDImportStringFrame.btnClose = ZN.CreateIconButton(WeakaurasSubframe.ZNDImportStringFrame, "TOPRIGHT", WeakaurasSubframe.ZNDImportStringFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
WeakaurasSubframe.ZNDImportStringFrame.editbox = ZN.MultiLineEditBox("ZNDImportEditBox", WeakaurasSubframe.ZNDImportStringFrame, "TOP", WeakaurasSubframe.ZNDImportStringFrame, "TOP", 680, 450, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, ZNDImportString, "LEFT")
-- ZND Wago Url Frame
ZNDWagoUrlFrame = ZN.createSubFrame("ZNDWagoUrlFrame",ZNFrame, 302, 152, ZN.Colors.ROWBG, 1, 'CENTER', 'TOOLTIP', true)
ZNDWagoUrlFrame:SetScript("OnMouseDown", function(self, button)end)
table.insert(ZN.DropDownsEdit, ZNDWagoUrlFrame)
ZNDWagoUrlFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNDWagoUrlFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZNDWagoUrlFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
ZNDWagoUrlFrame.btnClose = ZN.CreateIconButton(ZNDWagoUrlFrame, "TOPRIGHT", ZNDWagoUrlFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNDWagoUrlFrame.UrlBox = ZN.SingleLineEditBox("UrlBox", ZNDWagoUrlFrame, "CENTER", ZNDWagoUrlFrame, "CENTER", 250, 30, 0, 0, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, ZNDWagoUrl, "CENTER")
-- ZND Button Functions
WeakaurasSubframe.ZNDImportStringFrame.btnClose:SetScript("OnClick", function(self) WeakaurasSubframe.ZNDImportStringFrame:Hide() end)
WeakaurasSubframe.ZNDImportStringButton:SetScript("OnClick", function(self) WeakaurasSubframe.ZNDImportStringFrame:Show() end)
WeakaurasSubframe.ZNDWagoButton:SetScript("OnClick", function(self) ZNDWagoUrlFrame:Show() end)
ZNDWagoUrlFrame.btnClose:SetScript("OnClick", function(self) ZNDWagoUrlFrame:Hide() end)
--[[ ##############################################################################
  Player Group Imp / Exp
############################################################################## --]]
-- Import
GroupTemplateSubframe = ImpExpContent.GroupTemplateSubframe
GroupTemplateSubframe.ImportEditBox = ZN.MultiLineEditBox("GRPTemplateImportEditBox", GroupTemplateSubframe, "BOTTOM", GroupTemplateSubframe, "BOTTOM", 660, 180, 0, 15, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
GroupTemplateSubframe.ImportNameTextBox = ZN.SingleLineEditBox("ImportNameTextBox", GroupTemplateSubframe, "BOTTOMLEFT", GroupTemplateSubframe.ImportEditBox, "TOPLEFT", 400, 30, 0, 10, 10, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Enter Template Name", "LEFT")
GroupTemplateSubframe.TemplateImportButton = ZN.CreateGenericButton("TemplateImportButton", GroupTemplateSubframe, "BOTTOMRIGHT", GroupTemplateSubframe.ImportEditBox, "TOPRIGHT", 200, 30, 0, 10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Import", "CENTER",true )

GroupTemplateSubframe.TemplateImportButton:SetScript("OnClick", function(self) 
  local newTemplateName = GroupTemplateSubframe.ImportNameTextBox:GetText()
  local encstr = GroupTemplateSubframe.ImportEditBox.editbox:GetText()
  local decstr = ZN:dec(encstr)

  if newTemplateName == "Enter Template Name" or newTemplateName == "" then
    UIErrorsFrame:AddMessage("Please Enter a Name for your Template", 0.8, 0.07, 0.2, 5.0)    
    return
  end
  if encstr == "" then
    UIErrorsFrame:AddMessage("You need to insert an import string", 0.8, 0.07, 0.2, 5.0)
    return
  end

  ZNotes.GroupTemplates[newTemplateName] = loadstring(decstr)()

  GroupTemplateSubframe.ImportEditBox.editbox:SetText("|cff"..ZN.Colors.itemUncommon.."Template successfully imported as|r |cff"..ZN.Colors.chatInstance.."'"..newTemplateName.."'|r")
end)
-- Export
GroupTemplateSubframe = ImpExpContent.GroupTemplateSubframe
GroupTemplateSubframe.ExportEditBox = ZN.MultiLineEditBox("GRPTemplateExportEditBox", GroupTemplateSubframe, "TOP", GroupTemplateSubframe, "TOP", 660, 180, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
GroupTemplateSubframe.TemplateSelectButton = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", GroupTemplateSubframe, "BOTTOMLEFT", GroupTemplateSubframe.ExportEditBox, "TOPLEFT", 240, 30, 0, 10,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Select Group Template..", "LEFT",true )
GroupTemplateSubframe.TemplateSelectButton.doOnUpdate = true
GroupTemplateSubframe.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) selectedTemplate = newValue end
GroupTemplateSubframe.TemplateExportButton = ZN.CreateGenericButton("TemplateExportButton", GroupTemplateSubframe, "BOTTOMRIGHT", GroupTemplateSubframe.ExportEditBox, "TOPRIGHT", 200, 30, 0, 10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Export", "CENTER",true )

GroupTemplateSubframe.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTemplateTableWithoutCurrentOrder(ZNotes.GroupTemplates), 240, ZN.Colors.INACTIVE, "LEFT", 10) end)
GroupTemplateSubframe.TemplateExportButton:SetScript("OnClick", function(self) 
  if selectedTemplate == nil or selectedTemplate == "Select Group Template.." then
    ZN:Print("You need to select a Group Template")
    return
  end
  local str = ZN:serializeTable(ZNotes.GroupTemplates[selectedTemplate], nil, true) 
  
  GroupTemplateSubframe.ExportEditBox.editbox:SetText(ZN:enc(str)) 
end)