local _, ZN, L = ...

local ZBMImportString = "!WA:2!TZxxSTr21bBAMD3wUBtSLJD3DZMSZoBKxsBkArklVoExLgrrkBLirjts5)KuOgY5soZkYzMDMH6h71bic5HffinikTPjzxeeOh(kkq6dvTOnOBYxlCtYl9Lle6dciVzuG(uFzbsbAAtBpN79odhsouw2BtFQ0qdhEV3Zzo3Z5Cp3Z9CoJJuFiLyd5uCSuPtLEOwdPoK67MoBdBZnYMB(Bw4HvnTvj2zvQTMQTPL1jY2u)U3vXwvQSPztxDR9vA7QzApVLRUPHtm7TMVEDhI71(cR(6)QJbF2UHTUA5TSiYfZTB92nBoLUDTMKvl6yPuJ8uzAB306L1CDTCUYfUWgknmtPBEH52AbITJPHsZCzN7cx2wPgd7xQOJRITBSS6g6UXQwh(Yrl22U26nAaJVWzTf3(TZ6cpXSkTTvEOt7QK1jgULAxVU(M7vzQjlvUsPYtwSCrw7vVgrPPRwrdLweNyB7yrA2CgvNy7QsQcGGKU91Yp7ctV4S(4AbBcGRILwi)SZMTnqmvTAQSfXExeIsAMBmVXdCyFnjq5Rt2PTHGYITNQUZB12G1CgLMnToPc7(Y8(NZuL8dp2E1mB2ULrjKff9d1nCj2aV4gWCeydxFhfd9wkih5s0p(00tL1W0GSVkmzX2QGtDBhsntdvNhquCiLCTjgnC1EMTXFHti65Y2sr3aGLEo65PjPJ8m0uWTNO3wkQ0uVHr1PYxOC(Izvjo1E4Di2MsznDCKaA1XgKiiDhXEDo1DYTB7qMvVLURw2MMkQ)CBDdqBQT1zk2QnOWeRQRstGfEg6NlwXAnvCCW7YcS9A4n7aqxH1SwwqStyTzTUvhGSRZ1gW73vvheQ1a8Ufdl2MnzqyZhEgoQ1VlRX9RkuINYSPP9xmA0OleD0uJBZ5MeTIo1aOIUJdPz9fmbMEMYZVqvU(V2U8VZR2GyDYsVDBfBI00G2S0n10Dj7AtAaKeYAFG6wGMKEn2CwavjGcEQInrMYZUhVjonejsKOzDmTD3fzTedvGxTnS0Jl4H7CzI0ipeeMaJ2WDAyUBAxT4K5MzXszARRU34LlQz92J1(M5(CpGJA(cWxPQdPfitkMo1OPgDxxZAcb0ZhPYoY6Qfhv6ozNBhC15n1vD1E29QBdRaaDffxLOFOIrnyv90yt4SQAPPkMpFHDuSRnltx6RDMQanvxVrmXeAgd4HgzpoCm2hnT9McJb)T)dFg0wWX2fvk15wk2t3OUPnxp(mwppOMzAteMrYJlYYBBBA7SAvBfv92oFTNBOAN7DlUly2WEngfF6SnAAUH2U6aslz22Ug5Lo2(UKnDtpTjSCh45JtBeH(mrO1PP3Nbxrpgk9zPpxweWv3Pom4PBQ0WXE(flp7mfYZqyLAEkjr3bXzgeNwNyAB97kD92kQixsQCz61OP3UQIqCgfeNwNGrctbdhwH1cMhiElntU87Y6GXAkwCMRETYpGrtCw0TJ8q)hdJAOo0x)NtVS)AcdWWJTg9kyd03GDDs21pp76uSRFb213KDnl76Vh7Ao86d95nEpG5SrlKa5VV)ZgzBPTXF22MKfgOlNklZBXk(mOXiyjiz5PuCCb91Sk2lV4mJ05xJucbam(6AUkDfuD7bm0N3qPAtIQgxe6VimAq2WTISBT2oUMTWN3MrgUoZsPPr8kj5)dTsNiMe8rVUes9vigRlPyO6)JuWcfxIKRgXGno8tttyPTKLTzdPj6zGPiBAPZTCwwVfrAePRsCX7INWhC4rXG9ZlnA34f)ytagJHKJlAOlfxLoU8WPQdOAyhzPKmytk1HYXpKMoePWWdoSoJYqnM334FH)X6KDPCJBHKDYflpp9P)bOb99qBl26SvwBxxiJl2uXUbjlkySsj9i(mYiJWS6dBgd3wCdC13tDdBqTSaqTA0tvvJOa2aOFZJBByohbWSg9BfTo0HRzJgnj4qZbuHwM1iBbBS32qDEdWQrDfW0TwwCoV7cWoOsLWU4Gs)JPFhn63fmX7GBUozZM033AOC8Fjb7CkHsjBh67P1faBJ2VN3O5wWWpbUxSKj8dPwBHTZh8)pGWmA3QkqXFNvZ0szZjY64sSIcDLPLUru67)agULAYS1rFVtd0Hl0c32hnJ1Ly6kGUGeS6rAdDGAuSSiW9vjGkaVRAGhsQMByiP7izqiQe1Bq)dbUf9pcyu0Vnsjtt)gvBra7BTGM)dOFtRZTiOxKFZILLkycAXMWIEjgVN9tuNFDf9M4cPuCWl60c4fcONlEzn4H1sVHMlq8kQsUMsgMUAGQjqz4vb7KOIidPsgI3qXbhNKdyVcHbPGeDZwTaFEYFRILr2k6)dqy(0jNTgYSdjRVb9pfiTRKhnCaRuLMSPo80GhsttZ1KaULKoS5gsSM1L2cmKlvttbD5deUsOcgd1NIgB)1vS1XPoZ8)QGshopJIMhVg7w8z(TPNQOUHvBxKQ)wrPV3XPFx0lgfh67xK9ORYLQNEhM)in1niAik4YwT(MeacP)fDq27B9PNHTvLuj0trPzY5WMdO7EsOs639b8TYyD7q)Ron9VwJ(J0ON87Fw6q)RGMh3a3E8VQOPRskI6wQ0ttpJxROpC7XSp12sfUUFdIbXwVg33sQm93L(80xig9tt)m0pyZNAtF7KGUadmhUPMyDS(rcy6lqZSfJqx1valsbAh0Rz64bSxY3WFj5oReKxrcM6PhLBKkL)dhHY7(Enw7JgHzaahDzt1JGCTBtEJybTc2ZfaNKuSde4TySxd(1mBvvXvmn8nRd2LdaNpibT2tsbZry1IZsW(dZKBf)(6Z6)iJqsbhNbywLwSxMFxJ5XHu6ICWpOc2AjLwhwPizPOB7eVxkmHKQzSETBdZK1K(ktijdQ3flJluL7Bm4wN9146lLEfPqhkAKGKsdUf2kFP1hWOyWpIVo0Bgus0haipvAGt9ULOORzadKKYU1sRVuMvwH9468ZqbfxDsAsQ5gFSKiVNTYCgW7Z4imjsiniOWUdTVqBKKc1bInOnr9vosoWHGSTuPw7WgWyRm4EzlmvLh8asp6G7l4sPZZOKrsp4rFiicfrdUxd9MjLgyVS1(h20)IHlpsmabsa9uUbL(gNNTLW(DW7fEN5JdHhz8Wb4y9LYxyQ5xepKmp0cjL60q(c5skTWStEB4(I5VA(cvYntPjZoB(EBoFbwR0xeoySgP2Av52(PVmvI(POV0hY3B4gInbDSE(7XifvZsctMYvbpoKJDF6Rgd2Rb346dWnvO)DWgg4ofpG(3Z244d2mY77VJbBgKe2hlPuQuPs0L9143Pqo4GoGV6PGdlIheCIjyAzY81DiOstap4EM(CZmCCbRJoYOjuUehzD5IpgAMgC0ZSE0Vr8Go5B3ND3(hgydfgaCb3p7qqhg5P4bHkXHmyH6hG47D)dvtIbEhh8P))bX0pgeEV6zqz11pAYQWKgGUxh2hofNqQFIhLqdqgiujFCeb9Wsh9WfjG9GJiFRJ)d(B361si77oG1REm4plDyRHeN0Kh4TznBOxZkUpR2LJlp8G7ee8ey0Z(dpgv)m03AvA8R)qy)1jvFlaDe150n0Oj4bMR7GRDH39tTVRTIHdCOAEu4(GQSqoTjZf2kS712rPPLMIOBwqiYgL)9vJY7BAGe3msvFkfpEPnXXjPeJXMusL00vPVdj3ViKXZgqZ9CS4J2OcE4zyt)X62DPECotXaoyiiI9PFPZjLb(do(SwklD03O4I7LUGuM(eTSjlSvv848H5OdE)I4mb0y6exitcazbyfERZcc(HCOAugZfE7JchFbh7ScvycIv5YLIrrdT8axI)EvuA3rsJIRJZf0BfTidWf(yJMA807Wgnxsp0wrgAZiB7fd3mq)7Wab7EFhaz45BkHTWbJRe80HOeyNoPud4VQWFkWF2zGFd)vf(tjZhv1cf7gPJ1NNWCjQDYgjR2ZbgGZV6ET83kEiOPpjkd(KP73NFV(7AMfq2vLfOuseoldznwV3GwEClX33g(gh9TeFFBpYjO(XTq9Ra6NX5GaQM8UtKWdBHoWB7nWBNiOoixTzYO0tahRTkCUAhIlZcX)m94OXcqT7d9Iv9mgtBBA4Qz9j9IMagzSC6o8yPvKfzn5HTEOJRET12kNqbsJ(lIIXuwXfBGOrh)K760UArwyQDUZ60tTd8tEKB3N)vfEOBZGHdu0IjlMCpRiUYDcjklU5ImdvzDDhDGw0eXbUcrTbjBbtdIxdy83FLZqp1EIGnwb(7DpJ1RGKEf2fEqZQyvb9jOcWqQPJrQoYo(dbMH8aRwXrtb4cDcF(d5T6fZE6x36uSwWWpIbxUglybzNe(5hYFy6Bs4H8(RUpFkFBEShJWctzf0mUE9TOP3LRvH87SfMVqE6PSbEgogwKC7ncXvWqRTB(nr5PZgkBznua6v8iEPJ1vR3I3Auw4xRSbWUUPTI123uCZ((OLzK4xk4abcX(EZuOaUxnlAYSofsJvTEHqyV8BO)Koigdf4liydcQjI1lpijJi1gAV7N8Gi)wrP)BYdBq)vmPa9FN(1P)h0Fn9)8Rs)VICqKJrtFqe47Jtp1brIEqKpgJpDqKN6Gip9brEMx6yhe53(GiXoiYZs)Lhe552LppMn)0LdHWn8i8ZDqKt8che5KaI)4RYjIqgUJ)Wrk05XLcPRhcbU3mtnFHk80GfKiO)5JzDIa7(l2)xDD63tJ(91O)an6FMg9p500)YJt)Bo(dzXPnBtWmagK2mtMlxVqRSPg9B9thIlQZeilcvNPaMeb6T2B9eVLHtRz)IBC73Ah)q6d81U8cbWtr2ttBxbM8uwL1v3g8cxkRITZ(E5UHBKzxrQl81RzzcXrxLKffnCmjYTJ1j6eO(f5Nt5NTh7jYJf3e08(MkywZWeIzO6VWL1bZ8vA5HRrxIUm9JrFkbg0vvjgflK)g5lwSZYm6QrPk0Q0FhW7QZwKDwrRR0jFetQQc22w(MeL1MeS04S8cMBqSz3ohrvxzz2XKCwUMIBMuMnASTQzfgs0OFIZc(z)Y)tHeOSrES(GdV3tywkF5fxi8GQ)4I9yX8d7d334yagKMSAvBY66m7(IyrIb4GNpB)9DNkhdMy8h9sFUlp6OxgpvS8S6gRjIzqS7JiSKfy)f4dFjYwOjPa4WH3Zmy2i9r2sYxL402rgr24JD5x)IJNu0opX6ly6Y78IxASXV4LXNrxNMcqiyecC2)Eb7HD8cXH2b6vcCUhtVuSpIcKCZlvy(YsLNFXPU2)tiqWipfGt4Sw7Mnztw5o6LldNi(Q5lptHRoDXjNl)Yy2YkQORwgZadoPq(zLllNeNNmmiWwnBthNNmS96CSXWGhTXsA9tg6UKG4yOqGVwMMgpzyBCo2qeiWLRToZ19Nm8Dro(8qIaNWk(wMgQpzOCmokf4WtEWQCLNmeMriqyOWtIaUg(KHT0YmXbapUCs49nZ3oaB(gatXBYzPoR3uxr0yGLAENtp8JF3Pz4i3yEc6ltd84rGMB4P6eDwHFxA(xzyojxBnyKSGdkjsVCsr8(6eldFCU0m5wjysey)gSSDV7)gbZDbltV9mm(a4hZGLuMGPsG3Cnyg2GOgspOxJWUpKq6cNGyalWVakrwoyNEU(JZDyqESbwav4rLLDykV7r4ra1R1fwwxPzBpWtZIevWE9oC4ahGl4VAtrVz6R3EoQ(GggxsbDlUP3(frGN9f23yx8IJoAxubx4ICqXD4SnGgoB7d4Rc3OYC6o1QC92OTDtJ5GD(7ID0jWMm9K3W7ORIG5l)QYCvN(ZlplPIaCPt23y7jnjI0kWIEkSetovk9q6h6bPcoU0LcOX6h5AKIxcwFHQJ2ngCg8d5WXbxvPr2KJy4gO9gWjoW2skHZazz)JVlk3aWvsgiOI2ys9FWCXHz9)DCxtEIVJlp6MWKvGgVNs6KPtGHnj9RN4czgF8Khv4YKmZteCJLCSGWfZRYi0RhpKj4LsmWz4rFcce6JlnEXhxqgp5LeGmizVieMHApLlJrv4kDLYVodiOs86Eg5yjW9nc0Eyw56NuqxWcsgEbfEKrWykhMNAOr2eSy(k0U80XbaMXb8cFEJznvGdZexglqazHudT)v5QPUb2wkmxKPWJoGwXyD3jhbSr2DgdGbMyqrDcTYinHSSuOzY9rG1(tOlIUj6BCHMtOboF7kUzEP72R(jKxzGSIVcon6oA6(KuiJpuIs4matLiDpT2ARc8nXweKM4TXL51TQCI(gjVkncj7)SAPGN4F57E37khKD4dM)er0YeSHgcHkQvc26NWEAbRLcXdvouumRUJBxf3LvtDEOOd(iscgrtWDKOF1LqvGWeEJcGR0sXTMwC5HVNU6vGL8ZKlvk5HVpGTWwk0vcl8Yup3NMapzCnow)j4AC2ZOb)H8Al9Lx2EzJvo)R13(vafHq0HAqpkUICp5WgvWIhpWa5s(bNP7GJvEs4mmj8Z2F)1THO(QaXry5ohWwFG0PgUKxjmaIlut(kc9e8z3f1Z6nrVpU(w8gAU5fRiWZP1nRl(sdRSYijqH4aaczUZyuIulOMf2yztOX4HijIV0x((RCEgoheszb0OeWe7HGIp8MD(xcqfti0cRSoqbth8WRGIhd8YzN9L87EOrqCDOOIRNmama7wXmW2ncEhG)8o2at)Zkh686Wu26rPqOMgQoG4SecciyoghuE)penNYyO27EH7aHWp6lGhLWIAg52i4sqWOrQrg(ESXeuzjSY3jWbDWHZ3OtkyeDwY3peXdnXkbQ2L09uTlEJj8QLqOvDORDhm3MTCKvwI6goGBTXzCTbxkh4N71z9vspUwYoZ1K(k03Fa13riYWWA7qfkSLc)FsL)3xQCKw(F0MMOaMfUtwfz2JioGKLjypm5AaoUp(6zhuVTf7TFzP(FkhQCPh9i2rq7dPHOtEeqOj8GTl0jEfDJY2Gj4vo)rcrmzDyi5DQH7a0ZoljoQZ1FdVMPJKmUpN4iimyhJpa55dlyDqAej8yEE9EO4jmL9hzXdEK6SxJb11nuJ3X93Kc2cqVYhX5Bqxj4Ur4jYLNM9r(roDEKu9amcD0m0C)e)MHxpia)iz9s4XHVnIohFgRY7V0gDFWqEBStfmG2xsGXvoePzSpQ28VxaPa4KCq33dMVhFAjP4MK((icG0X3t8eAEQo3prye4rIDYR45ar)GnlgOH7WoR1sWHGxzI1dD88ZhJxpFGtjFukk0UO2Gr3RVYemq4s8Q(0Ud9I)bjcg)fSrrSoG7M02wzRWpwl2Ds5Ri3DDQ5zf1h4LsVsIZDPrpFi9KzLe9qr(ypifzjo6SK1ckU4BIAIyH5CmgYim5A5VIuBhI09WOep69rb4STvgz8uJgaQ6wkOfw54PgjHSuQu(OoWyAQ44ceLQFCmeBGKucSDutXcJGnNYUcZoiIZKsIQkAdnDGSCcQUGbnflgEwCZr4XcJxoKaa1)Ahy0jcpylDOrY57Oh9iOrpO6UU0Wt27HU3CcPxvay3ey34eJ3y3iBq2A9Nb9ufCSU7rjqyRYpRMPzrTyj51iBj7PjF)KDLhxCYfuLPjUBKKUlPvGAuverZATTTXAnfum05lTXrNOhrL3OMycgAg4RDxxf1DVlhfJHfzuVsSDhvZk8kxyv6jo7brUG1yDvcbZ3vje0vHdmPU91mTnWAh4GiP1yfCtAXB14QGabFbBjRYFttZXR9kI2EM26WeHL4LDV28fN5oZxO8KZs1EXZs)PxIou0T9ERMSf57OilnqrT5XV15fbI8nV0USuGWEVGYIVPCaHFqKr3N3kosdsZQZb6ce7TTSnTazpoMT9QASvZExtZwrE3HTnB7IUhtD2t4CnAm)40F)nJ898LF99Yd1RhBS956AxlwlDcpxm)axYdSfQQk75m7WQNpX9Lt6d7vlTy2k4UmjchmDvbmlBSSblniJmYm5yBX6LRYTiUHc778o1aaGljgq32y32dO7(cQts5Htl3ja96tKo5LdQ5k4tbjEBxmPsGpzbNX2UOdBlPVsORk9DX0VWW3V3Yi7vci8gqvADqK40F2d7Uo4O)Aw1ZeJ(jaTQXwL(bw)OPQmLMIl6wDkS8arniwL0mhXXrPbH)F1bXFT7KV48O19xlrShtiQu(2lGGflMWBZoXK3FvDLRUKSFZYRG1ccYt6)9gG)AdWQo3teJEYcNLo0p3)9CaF3gW3ZHFm9NG1n)VWtFwYRW5TyKgpb0jLelBsIV1JQeB)CRXhfl3TDnh6zZI(joF5waB6CKnXe(OQhSGVfMOw3eYfiBWEfT63wxh1gsnCitilhMTWoVcFDYJMhYZzAq8Ea9H)(tlYe99mF0gFd(WdLQ7THuP67SuHpt6XSoQAqFXy0h8WPU2KLRmxPRwzYC5MVa71M4fI59(YqF1y0pBgfJTWA136tf6cgVkIKg)60RzxE(fW6CllwzK01P)lXOV(LeVn9VrN3JE634073D9BsNJ(nPpDmRxDWlk9lQ1OB7vNNhejwGxuaED)YFrb6RLt0Bl72Pkw)ApNTOKvpiYz5VV9Y6QpalXVIKAeDyxj8)ae8kEUNjcvng9w792kx9TDDMBQ7SrlAJi71Bz1s1Ir1JDqKuSkVBO1)hV1)9p"
local ZBMWagoUrl = "https://wago.io/ssH2QdjlK"
local ZNDImportString = "!WA:2!fRXsZTTXzjR6KPODsTLtCDJtAqqISjTOyKKJLD0eKgrkkjMirjts5NsIeeyjjSHaywaAj5hz6Ojth3M(ygDQtpQZ5K(d0o5q71D00FbEMETTto1J9B3feeGaGsoQZu6XIa7(9A3VV971YbV1W2fVA6jspXWBoS2WAp)TpSMI6d1WwTYAzyH)SHgAOvgA80x7f1SWAiCg3jBDMmg6p(XkynXYwwgo6T23Xs9riSTUL5fgSYE4TxUEDBKZc)LV26uRoWaduJtGM7Z)oNwduRZw6lARGrIZ12Wq82n1Dq7JrnakuENwOInWwTB5cEj9hJo9b8N5c2Gdo4qhQ02PPfE5woao2cFNUPdcBQyClUCCtSIkBMPkA7OGDeYOBQ7iuRo8LDtHDDW6nAaG(Mxc7(4VAFnuT21Rt5pEHClUYCRUyghQWO0gRm5U2Tqgg51SfEHD7AOhHmDkbqRV9bvYotPYvkvEMIL9MAfmcMQyPvYT4Ifnv2ezluKnrTfqkgonZ0gKMATmu2bH3RTPRiiG3XDN7tv)3)JF5adCQVLVS5J(dpqXufwZRybl2AzZvOCUI7PyQVPcDLof5SZrUqgtlt03IuSrLCWiZgonF1d1a5Ncrf6QbBJuTm1S3LcdDTsUsMnv0nbCjxHm6RssrgJKgE8C9oIKUwRF24I3RWSIJjEpe2sSGLdsCwDB66OOTQIbAOdQJHvlWBfhLH(oU8ohDikRQvkBXC5kCGUzDlmxQp)bmvnFbwTgiA11BiSNnYOoBzUFMLlxE5Lwm3CL3h2ClYmrSfCnhYBcyn0(0fKo3oiJHLI2uzaLL65lUzBW6uOOQHIT95j)cHm2GPe9HjBRRDWNDh9R)fBn3s1NR2WQx55JaYHJHUjSBVA5fZxih51MEUDRBb6zaRABI00BVj5chOHSvX6mZUmoOTDATaBBqvXuSgsCtfZ2kgg7i6y1OHbstS2oI42MM6MneDAQBlYrEArPpagMUzMMdzIKsf3sxZP5PRtUqn(y422Ozb21CYhI2jttDyfRHQRaRQQzOgvTo3cWyC1GLPyreDXt(8HakqwKSutsbSDtRTmrBrUzRlwcEueEMd)wnrMIyKks)rinYkvb0oqJRkldRkPru3xTTTJ1M032(0nQ32KDGkrsbr4JHfOUfPRFrzrjj2y61fnTCePhxQGmFuAUYmnvUH1oYKbKlGWchSqGJZIkMADFlTABmoJLTDqeOF8iRz(zbEggfpOrMAEpFC4j80IGEpcEcMPI6YtKs89IaAnRaW2lt8a8(6RN2rFtuyUsptillrNukmZ78XDRgakLi1(uu2BRybGKgOYWujINVPIzkq3Lumso6QwPFLMrIiHASXcaNKOu60XigQwGpUy217opSzljL8KYlhlhfJJIH(aQpCnapPB9aNxZukeSidBuSQ(yefxDpB2Ju5ZGQJ2xSh1Fw6K9BJpvKuM(5O2CEzXKfJux7LMHhttrMmDI1uhnbIxkJJS(84077DEUZ3S)GroTXMm21DqbaKdTBQOzT1D5beFRbixMKO1z66jE1wAkoqEkSVEbKdKfnoQ6TProYmd8k5mqIaNFpnRkCKAsg(sK1HiRS32(vE8yJvMfCHAZr9xJeBBdrNImIKGGNTgn5OgYo42ibFJsJPWh0Biw6wuxsYM6gDhgLFw5Xf87ehEvWnKrL5VVeWyP17EqilgbRqwQdjKyFjLsKbukXvZVcK6OPts6oMGGh2Uco)yHMRW27SY9ejloSRRqTvymqySXcV8aFs0fOVPGLimiSQ6WbXOCut9NM3Ses1oft)NStSZiyb1RrIa7zYb4g47kOcIHrG9C5jsg07c3JcYqPLnSkNhX4uIKrSc9qPRitpI49YyUeri0jlxZ7UMj8ColBLf4(d9TfKmv3ZaboGa7hDH6Jhp4sqiItTt3aspmH0tvhz7G)tkLF37rGboieUYoqP61V21Uw9PugF8PhFCgyDhdI)46paM4)1BamJU4mI4U7DJi4ZvTyhNVXzvrNMbQDqReFtCFxAS(rdXNi7lg6)p1osUXf4QIxEDuNDYJRwOhvPUP7a(Zl2Tgl6sXYS9M1q4EHRJ6PdKFSSypg5DwPmRVieFoN2u3KYgBOcsZgP5LvLqAKXNmDDWrj8sZ01nSSWjCz0hm14jt2dnS5hSp20ak)JX2ReGwUYlDgyhFAyZNsxVTu4)KZjqE9nUe5nE(R)cOYMkkgBPSJn1lD1wNLoqdeu9LUknOYYMvpmWRVWM9vwlldi(Oj5Tj)89y2IfGqddcf8Sb5DeoGhLJvOBnWpMtB7D7u97WtqUi5TiI7N1RAriEhRO8m04OhcbCmk5rXdPcKhdQs2y7bR4zmKiOsSB4l6XMab0cgujOgUVXTcv2J)QPKJVqRiDL2lKUvfYe3GcFxzIoFmIlmLB4X(jL(ajG8eibiyP25OMa58KFAr1Mi1hsUh5nf2JQbCWkQpSkrI8EK3xamD(RmnnIisAakuQYCZAkoIlA1Gcth9pL9Kn4TIXUvZCfYU8Q0ULW7stkXUdKRWSPexzXzUl8CXCZNRqLzZxAMmlMR3HZvWD0SlVuMzkxzXLNVsUBLRq5kRwyU8lc0k3SGrYP(xEPxW4EkX8aoPtNoOfdFsrzO25EeUUjxYc(NF2VeIGZrgI27dVifAo2bCEZYlGtaQ6umSoRB(gYIE5degmeRUBEwhtebv6gKq(jpl886udJMobTU9zgeWqb2I6Us7ZoUuu520PjCPQe6FUrVKbfI)od0RqY2b7qgMmW6KNBN(wnB2CLkfrrB9wd4TvCuBYCP4lYAKL6fAG(g7voXjm4nvfoEYrNqOFfXeF)u8hIK82NICXtr0lsZPrJEeM8(NN6TC0V)heGdLDnKPwDYbScpYtdUNv)EDyGBLpE)pLqt8podCy6y8ngXje3iJ0oV9a221JqtQyUtRZQWEUmVVWlzPH(MbADrF9NRcpmDLwUpqAt(j3C3TSWA3gR0A3B7(qgA)lBDM5W6pw8MTv0OTLvSCzY0ce56hqDWcH8PnGTjZBlnCiUj5tP9iL8j0)IDNhE(sKFu1myfDTQKzGxVvXwWgYovN0bzwDFNTanXo1bzUAn(Zv3TUbAB9AgqWZ5Ed36AVdVU2HicK8TE3ixpu7OkA7yQSPUAZwVx8W0cJu1P96FOIQDUVIHi3axE5vyTlUU(2inwHXF1pg)aiWGE9DYqNHCA6TuiPRDaTx2U9VM8kl8N)NF4)za4dzYHixL8HKRFjsPQKLRsYCqc882xt9Qj0MQmzKf(0vh4Vrb8a(IQ7Lsq(ybY1eij59Ipy)0)GJUd7pFeYSKCKVMVsw9uKBT9G)PEkxnC3x9SVO7rbn3zJWAWvxCPyj7ld7NWmlNoXiAJM8zsP8WD(sRMPsEiEEYOrtxZfN1mxZKLK(yJbNDOjM00nBNDqorI7tFQklrDPKXmnlpECmtpYtOQ)PtC)nE26JMCeqMLgzcxy70W2B4V7SHRQ4jyhi)uDipv)RySZI62o3xF9Kb8YfBVAiJmiT9mK7cPRCFYASoViqtYL1XfWh4pyEHSvY2uXjVzDR007UW2bHNrtZYCjKTTsde)EIsC57LR4YfwUCUlN8LfJkLV7ku081ugQwxwkM7PrYRPlDBhUxij3u84dlTo1lfDxiuJlP98N116OkqIB4mBIooQd3PEzVQI6atNIDKIRQlpRXe87HZfp3x8xOvG59xtgDC6wtBmv(TrgivNexnfKXdlenDh3dzFuVlkspTmTTZbgLE4kp9QhRROIwBnQeAdFv4wvwkFPSvU5Q5kvo)YfwAMIFUusADrtm1tDKcLhSFA6MnCpMLYIpHHaie(4xzfCdKd4JM1HS1wB18Jve8q7nmvEQmX0Jd8m13x0N8KH(vpzO)HNm0V2jd9PozOF9tg63Wf9NrE9cE1(WkIL8U0cGzzBrlnAJTf(JDlo1nFRwmpf8oBKsufCkBImsbg(MAiSx)H4qXYHkGlLEsVn8DxeBF74uuw2JEsHU9pMlDzPcOTOUMK6ZL9bX4PGilfSP7UhBcMOL71W4s8zTmrDyqi6p2yrCLJYHy70BsZGpuWUK9qRErlkkfBuZ(VUpg0rKsOE9(gKSCpG6GCnreJhtLBrFFnan6hm(k5jmK0OZS7Ws3mIni(E9LV)gRHxZC9rVCYOUHvUe7kmH5qK1sD0d09kwbssLWok(q5AKmQ78LHySxHhTlFUTwt3uJ173ustlLmEmC3vPlX0Ucv3WBCsXLpoTygcucsdgnUukO6KKIxrCQXfhTV4XTGcIxKYtS3A2lPGUXXMH9ukACJ5EHOmnwSjhgHoJAi(GEttS)eMNY4dIoLXhSEYJL82zVQtBi8BQfmp8KX8BlWp6XBa1lG(ul9mvY4mzPzi6V1b9G36936TFykpXlVrwFPx)MC0jo2gybmM9UBJ(sDHJ8oU93cOqcEGwH1prlsdFz)wNhVI46hj6POS(dAGc0IAdKFVqbDM(e2GXBHF0RYaeiYt2XkqSScO0si8VTKwGNkNe0jJCbf(3cGS7ZHpKkRhHfxFBZwG7piYdvbB8EiJMy7BxunynYtAhzwh8ls7yKbwV)whOvj)ocS(1JFr2fMPCLLknFLzMD2LlqEtbYxqAtEFbYwKTj78ndqEmRlwKBq(TKNr(swtQMI3gk3wsnd7VZ9gKNZ6Ge5oV1aKFZqKxzqAJx(9K)GxND(wA1Vf5)62WKFDZoT0H3zMrFvwJx81zMEg5CHg56cKmhCJpQWvF8hnB9c3Qg51ei7X75ZV7R(X0M(8eYth(r)978Fd"
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