local _, ZN, L = ...

local ZBMImportString = "!WA:2!TVtxSTrY5zALlhkV0gB5Co5YF3E7f5J0MIwKYYNpFrPruIYwjsu6iP)vwHAj3HC3tK7U3Sl1p2NdqeYdgini4uBtAUweui0hkAtBrvsrtrdqbmkckqFzGAFqVfa)qFmpCTnTn9N0VVzMD5sYLkY6A7tLcA)zMV5B(MV)MV5BMnw9H1IpSBXXtpw6jgU1W6dR)Om5AqT3i3mlERcpPQnvNqZPvBnDQTJZPY108(3xJQRu22UPNPZ(AT9mSPl64zAB5gNU1I1R7s8U(NF1x9NDc432nOM6L3YHOwCMDR3UzZPnP1AswTORJwnYZKTnTPZlA4554E1lEXn0AyN20(IlS1seQRTLwZzYTWfVcvRgh7xUORNg1lEotltV4vRd3CnIVTh1Srda(cNJkF8BMZd6XCATPApXTDvY6elVsTRx3CZ9Qm9uLkxPu5PkwUiV8QxNO10ZOOLwlIB8TDDinBoNUB8D1jvHMGKo965NFPzVX8b4AjkbWvXslLF(5Z1giMQon12Iq3fBrjd7nw06XU8Btbu(6KDABjPS47PB6(MTT4fNvRztNtRXFUSO(fS1jF3tSxn7MTBzvczrdvLQPB229R(H2rZYSLgYjUm7xzw2zYzzBr2xhgKyzvWHm1LuZ2s39XenxsjpkXQHNXZUn(goqyNpxlntlOTSZZUalfB0NLLgE8u9wsrTMMnSQoD(cLZxmNoXT2tUlHARKZ21vbOrxkijq6ngDDOtHU)07OrRnpV)(QNnxtBn9Fe10c0JA7C2ITAdQkXR6P1eyENL9AXlwRPMRl(uoGHxdFyN2UKk8InYbcCcVmN1D60iADHEa(8U6MG4SgG3T4yHA3K3cQa8ScuBEFEH7xvQ(oTDtB6xyOHgAPHaTDQGFsmk6wdA1qBduW8MTm9mQk06n2vCpVEdIZPl9wT1OeLzbDyLBzy6r2LsAaKdYyFS(wG(Jzn(4v2QsqV)m5CTPE7ImqILoWp2gmSeI190SQbgolzBA5XYSJlPzD(ZzlV4sauECHAmNpgihSPeP9vEu7lpLAtDxnBBt99MOCrdN3A823AMx7XIUvy)9svDjTartXmGD9y76zxtkN(yXQ8oQM6fht5U5wyh048wM6Egp3E1PGbaOYO5Pn07jOTzXIWHx1stxmF(c0nLg3)v)TFA02(evbLT6MnIVNORNZcQm2tGcbTdlVzbXLnTAXPMzUBu69GHgHcw03uqhlSlQOAk8AuSjY2FojAesPyXIn0W1o)JEJDbpf014u5ZNRrt7nm23JSPxMzTbJAGhpbRAm2ZgJvKLzFoOf9zESNJ9HYzc9ZQ7uhaE2MAnCPlEJYZpxH87ILxPMVcXq7G4mlItNtnl18(kVrBnDKzOuUmRelZ2v1Ke2qaH5Ckojmnaoyp1cekiEln3m53LxbxswS4Cx76LFmNMemU7e7jbDdNAyVf7v)rSReO)BbUxOgSRIfWED(1P4x)C8RtZV(55x)S8R54x)v5xNbV6CkaptP)MTD9i6e9fmTmyZtrpHWay)GEhzCzO4RTPKCaT4jOZYIsCsmhkUadoY9MwZ1d0CZPrV3nMB0oVnAjSbGtwp7vz3d1REmh95T0Q2KOBiKBbMCdfMrC7y7wdOq7wy)TzSrQZ9iABLOskXFO34KXvGFM1vqQVcXADfnl9Gxsd6yEefpdIfho8xtBWqwXHA3qzYEamnzthtHNYYMTikJQCnIh(uIKbnh6kEB)CkJ1nEXFucWySuC9q3APRBtbxhjuhjDDavJ4QQKI32ukDOC8hPPlrjk8GG1bkl94(3X)J(NZP7s9gNQi3u3O8ISp4pd8FVh6KHAY9tSDDPiUytnAdsouU4Kw5xWVrhDuUtEyox4XIBGwCpZnPG(ubGynyNPQbrdSpzFJtsTSxGay2G9odvhQWZUrJMee0zaQWi7AKTG5VBBPVOfyrxxd8tBKdhY7UemrPsjSkrtz)MSVPb7Bb(ZDX5qNQzt276m8mI3uGjivqHe1L9Tn6QbBJomx0Q5wa4NcNYvXgErP1wy5cGVjBhGOz)6a9Y(nWcML91R2IatM2ck(xJ9nCo)naPt(nlwwPGnOlzdgFkCwa)vuZBDnZMO6CArZl62cijzRxirzdtxLwMnm8uAcSgfpBflBpdqbrPkbVkhveDezGkLaXBO5IWP4c(nW2GuqYUhDoqeg5VDXY4OdJ2aiSa6CGJoKS(6SFxG0UAE08fSxuMQPj0BqN002EnfqTvXe8oJeRDDLTSBtvQzOHbyb8yfuoZr9zyX3FDnQjo05EExfK944Ci0n115pI953KDMIMwoT9qQ(DgI9Tpj7BHXoO5YE3I8UgqagtWZVdpgGMMwedefIifm6BqaiK9h0bzVRZNAo(8FkLW4YuMBgx(yadUsb1v(wpwm)iVAx2F0ZZ(Jny)jgSt)DohB4FkOzkCZSN4wfdtDsrpqHsN98SZ6xkg50ECVeTD0HR73GyrOM1erYXuzFu2hJ9cXzFk2Nwe)NRZxmFHPx8gy0rIyjtP0PG8fMjLYsZp1DGNlM)A5luzM5knvU5Z3BX5lWlL9XJZ2BZN51cCccQyCQXv4hjEhxBKq(1cvm3udQQUg4Ur4jjDasWM4)CVEutlMaFzvPXQ6kD74ZhXE02KxpEyxv9CbWjjnp6CU31i8kxZUvvnrTt2X3l48mu7cAsyxYK0GadmMCxgCIp3mReuxFUOhDusAyTfA0YLUrVmXUG5PHu6ICWFO(3APuwhmKuC0mPUj6LctQOBhVxVRWiznLV8KkQG2FXYODSAFWGZV1xHRVCMvuIeu0hcjTb8imF7YRpaO4TFuLmJP8zdle6dwKDQmWrD3ctm4jG3rstBT86lNDLv49uNxJSPODlPjPMxIXtHSDUn7Cw1TtGTjzsLb1kS6iRlYcjPrXF8bnlxGErQbccYXsNETddGXxzW1QYDWOoyaYm2GRlSv0f4uYGH9qqdkGgCTwMntPmWA5g9h2G)srlnsoaXrifuHNK(GZ3PsuVh(zzStb4qgVuXAgKARvv48M9Imf2NG9jFpHZ9BkNfZ15J8G462LKo0uRAB3un(dzVCCyIcCwN9Wzey)5G3EWnp7hW(l4E93BZyRg4xM77pfmjukL0PtNSlVFIkvMeqDptnimZfqdkZHamY5ieG3vKUyMiAiqa3iTF3KHJ1L2NNT(bd8sbaaxackZHGomrljc3QKhcWs5mG4h8WdvKXBEN4Cz)zaR(7bcGx(Si)(no(8ByM3oSpCioPs)e)HidKti)0ic6HLo2HlsadVJiFRZm0btO5xseZSnaddFg8NHnIZWYfCjYZ082nmR5KiGv7jWLpEqhUHxic7CF3t48rQb2m62ByHlAdIqxSmpwJfEsOLCYxWzsrcQ6ojtx8rFI99OAwUWInfzJAVQ8eVSjpOYk8Nn2rRPJHMSA(YZZnK4(1gsu3SanVzSQbKoUSlkX1nLcNtNsrN00tRVfp2VmLZehqX9SCXJguHxujmz74DhHspXdPzbRycK5b0VY5vYc)dlR0iTJjgosc5ZkxujBFYA(GfMIircbyUMqGJiotcfMj5fZMeqwiwHVHx4MFil2ef6cH3(OWjqWXJEVcxqSQqUuCi07Pi9D47RIs7osAuCDsHGERHkYB4sFGXsprMD4qlK0dVvSH3m22(5Ymlu)o8MGvVpSMBnCfhLWsentOe8bJqjGMjLsd4)QW)AW)0SW7W)vH)1Y((vTawoDM49f8PqIst1iv1WjEaMdgwrP31ZF7erGM(KO82Nkt)Hz7xFxJSqYUQ80fsIjyziRX53EqMh3wE)oWDe6BlVFhFYjS(XTr9Rq6NjenbunfvNmPp2IeW74d4DsgwhuO2m1qStbl0SkSsxxIh3dXpMDs0zbO29E(zSDoRzP2wEgf5PwsDeNNeK7pzc0EIRNzT12AgPQJrrEssmWCUQ5HfsmytC6DDBxTipDTU3DD2z2bEvKSX9f3QiY4zwmjzYsS5zQ65KPvTtQc55owUVivw301eCdAitDzfIEdsUc2we)cWCq)sNLDM9KPGRc8)JoRZlHdJk8lIujvXPcg2yfGDuZetqASDcabg2IeowX1qdCa3jbPpruQFUJzFnNZWlbtkhUvb14lEp3uWRVNOZm3KiY47xzFXq(oImYfJN8UkOtCZ6BXYSRqNcD1NRWIfYZodf4zim8mC2BMtRGzCA38BIst3n02Yz4q0RSl(KNORsVTO0H4jLSYga76wunNTVL8H9dql3fXprYbcL189MRqbCQBEww5vkLgR68crWEfpW((DqmMHSxqYgKutmNxCqsgzk(nE0h5aGZZEp1rSy)JCPa7FI91y)ZSFk7F5RW(xJX(3yzy)m2)o4v8)G9FYzrS)l2p)GyN4tEIdIDYdIn0bX(aSFYbXEMDfdG5ZpB5iOylFk(8he7x6foiw8yhe7zxv07raUBa4iP5(uqAErqA7n30lwOIy)Fc39SF)Xz1QZ(TwL97yW(ogSFpd2Fy1fadU2US)09hFSlNjtMuWTxD8jy)Dd9eUTyUMGDpMTYStnZm9MFATnnyVZF9WcPB2qjuV6CfW8P7CQojk(gIa8)H7e4dG9Z7k2daz7ktmVV25Us86)UQP(23n3ck50OU77VTfcFmSBT36jFtl3wZ)f24oV5o8niW1uNKdfqc8i3Tgw(ahb7XhIImInj7MRY9CHBdKLEGzkhqUhSmQJuJDx2YSpa7zKT0uxNyvSq(BMVyXogvSkdXwLPX(LHiPoxr(kYCUANCYpLUo4j7E3IOT2uGFf37TK9gek)Xfi6MA3JVoh37vtZlBA7gn2w3UchjgSp85GGSFXter(Kg9P6hcEVRJRu(Y3yPOZS8tl2JhpiRkIaJJdyqzQQvPK1n5E6LzcetIGyVBdMJD6z4TjUORx(1UYyJDfCTNQZBATMCD5XFiIWsoG3wGp8fjBHoGcHdxrnZHBMvaYww9Ae32UQiYMy8R8QxAIuYYfBI8s2EIkV0LhFIlDfSp6APuacbxoqK(piCn81w4N9oGGvGq7X9yj(7tjYmlQuyXYkLx8gtF9)NqIGP3jeRWDT2nBYhTQDumVhSI3RLV8CfU2SfNAH83d3YOIAM6LX9HahuidTYvutHJtogKyRg12194HTxvGnog8Pn(E1E8q3LLehhfs81Y2264HTjeydrGexEutEC6hp8Djb(8rIeNGjFlBl9JhkhxGsjo8Lh8JPXXdHzLceok8LiqCGhpSLrLloG2J2tYqT5HYbylWdyArrUl3XGtFfzHHS18xLE0l(UtXWcUrlY(YiViBeO)gX(9HXMiEkJ4wwEeX1wdGKNdof5ESMsMwTozYiaNlp3mReoj983bxBp4HVE4C8Z3UZEataGynf89ejCQ6ffxdgHni6rudgKim9djIQWbiMUc8gqjQQHR0poFCSda5Zg4PtrK6t(kN8FgBp2qZADHL11A22V5z45HkCT(ReCGa4bHN2uwB2(QTN1LpiWeskOA5d9wVmn38ByDJFPln2yDrfcHlYbLpHJ2qA485pGBfUzLfmDRv5nAJ(2TTWqM6ID0j1KC9Kx3FDQYmMR(YQcvN(3CA(E6bTltQ(GTNTHqM7EE(pbtm10PnJOEOgKke4YujKgBqcIrkEzW(cvhPng82yhXkHdBvzq2uGy4bO8gWcmWYsPGJav1G1Ql3ZDimsEtqfTXv6Fv4YvUg8EcpBR2TQsOjuhBtyWkrJFVKjvMKyosY8QjVy2jMi1rTDztL9y1UXtnE42f3)4bywpredWlNCGJWJ(aei0NwA8spTnzIuxw2Kbj7LjWms)PczmQcxPRTuRdaHvIx33jhpuPxpu5r5LRFsbJblmz4Ns4rhfZOCuHQHoztYZ4Ru7YxhhAWCUqy4lAnVTgSqMeQ4(ZRkLAO)Vkxl9nXYsJ71xAC9lOxmE1bZAvsBDOpuLhtai(NLvXfNuKuJycgm473AQkqrvkN)2LvxzqPEc9(OmPQQsK7G6XU74JdKH2)ETI94KV)gh9U7odKL2vE483XA)tiHKkJIB)Lros3PRpG0Ja(ijQEZXhx9ltpL2ARcIjmVbO5GpMqvCGqvt2hKIdKXK9pG4hBcv(m)Q3)(3xnmFjOzbJizjtYbTlkw6LxCSi42Qr1BHp2eYovnsumVPRxxNMkNMMICChUlsboStkcAPFwxKkL4MxJsIR2sZRMrc1rEGP(vb3lZnt60QJ8qaBrz211wJ4VR7I4Nc1ZO)e8OMG(t49rdrN8kl)LUh9EwRCHxPV5gbkcBrhQbJE5QQ9SP0OMwIeHaui5h8wxhgw1PG1lLmyN77)myiprtG4iQndhWwFnPZPMsDLOAqcPAYxwQNG9DxupV2K92D9zTh5MTlTiW1e2nRlXYJOTYOjrH4aAeYCNZQePwynlSWY2qHjIqsKy5V0dx5cCCoiKYZEsjGj2dbLyKn78xsqftk0I6iAGcMo4rCKiEkWRGD23(z3dncIRdfvc9KbGbyMXYCV9DHG3g4pVnfy6Fg1ihxhMYwpkfs10i1bKRBrsaH3nZbTv(hIMtzCde72WDGTiivpq0RGrnNCBe2eeCAKE0rEahMWklrDuCcTOkeCXKNkHtF0YbX8i70KRe64RKPNJVIpmjp6hsfp(Hk00YfIkobNrm4dCXd6yUKYNjKQdPNkq)8HjpsIJdLxY1G))zMhzM5rYylSB6bByHYfEMm5h1XEKmHeiC5XHjoc5llaF9mF1ajIieP8fm2lIuJq94iGqBOJPf6KDHUrzBWj2kx4iHO)VqzRdVmraDFeyD8LihI8cAlywPmQcUek)Apu8eL62VqBHJuLsLJa(wDtl9eDc3lLKTa0R6rC8(0yc(0yoQol)N6dt()oSQb1WOk)iB(lNGmisVoRSep)XFXn6EbnIY4bXoGYxwIXvoeHX7FhJHeeqmDHJ2m8EHeqlPKpKkiKgOjDcvcxqHu2P8WKrrGhj2P4W2gkXa8rXa98f1sdwgwZ2ktUEKWlwohE9cHwu3r5yj2f1goXx9D(5cLjb)Z)y3zLiiU3WPMaluEEZGNMIs12k6vHHvNs9QQDFaU8Dcg04LZSsYZF5XUqe1KDLK9qrbypmf5ixPNIZsAE43YvY4rflhMnfCFNYFvL2UeLhGjqDShIcW5BRn6ePhluRQ7OHoivtKE0KQkPthG6qW0uZ1dik9GLDl9)NsHKsPMMdMCxbLDvUBmeNPuKNUMnmmbYYnS6cMpr8CyZtPm2E8mzRgrco632bGozKjjiensUqh9OFb0OFR6(8zHle1hDF2jvEzzd7Ma7gNyQ46gzdyaOemc650GXRUhLaPVQGn8ldFr2lRUgzlvFn5hMQR94ehCHvzAItMOy6rAf6WBkt2xT2ukEimbfdtHPncDYEev(qn5KC0mWplRUowX9AokHrS)QYZE6o62veNSGvzN6ChelHZ4DT96l212R31MQpLj962ulCF1pi25n4h9KmYV6Tvbbc(Lwswv8TioJ4uirm2ZMAcde(EsS71xS4C3DXcLNAEMXh)CS)YlZgEOT9)EBOYTcOiFhsgIksTP7hhiYjU8U8DhG)fRKd)uQac)Gyj3xukcPfPz1faDbcDBhQTdi7ry22)OBUAU7BB3k2JgHA32dJVK9wSQX2tgGk6p)KShTzS3nqe23NGsVXCXNQRRjU4L0jHsXdY5MivmO2QQFWJJOFHKpunvqBVwPBKRcortYOBMPUSn3Z6Ew8njy0rNBg(SS(7K3weViB7B)21GgaxsoGQPy10buDFPHiL6izu7K(AZjZK6kHvEL8PWep1d3YfiQQWJyQhgY1YMRePHzqqIbhA6975mvHF3Rhe7JY(HpP7d9f7NYp8iXzFyqXj1Q4jR(otxzAdnpmY304HHd1s4NKKfiUUAniIpR9eVYDZxCr0d(RKmECzOIh9m92Xe9O3g88qiooJh7mkp57VKCF8BnxrNDQ4Stx4CSH)rbFjb4xpa(Le89yFFK3)34BrP4FS2D4CBXgeNsrA7Mc)Oa1j0G9(sa1KtQ6lu6zQk87kevvNuTazd(xvu)(ip(mvv1OC225ZmRZEy5tfZyBr8PKJMZ6W469h1ESBz60DTyS(gMb7KeCb)A9(bpz6Rpv5klu6AvMAMzwSa)ly4fI7)PNWE54SptwnRT4hB(priNR9FAeznwGvIwEXLWdzwo8ujY8y)dXzV6LLFH3VENVTB2x)53V7Zo5EHggNKnp7BSBNd45x9d58Yr21DFothI9bJtLh7ZdIPi(sUvn1FCyoMZlnym5FUi9pYApBmwT4he7veNJTBT3BPDT3YZDHPV7gT2R3ZVkZi(2(N8ZdGx78HdiohWIpCG(k5u9wYWR)3F7)7)"
local ZBMWagoUrl = "https://wago.io/ssH2QdjlK"
local ZNDImportString = "!WA:2!fJXsZTTXzrXjTny6dB5ANAh3weylzsBkwkPkzBvZMWxsM28HcjKKFiBiqGfeWccazbOEz72u1oD8m9u9T2J6CoPFbD8HEEhn9qp7z6LEQt(f0VDbijiPysSu7eEGyXU47B)E)kYkJ5wBMKPso7yBoM6yQV6Yh1qwzdvSTtoBtB89Ign6srHJFBdBSkcNn4qNZK10yV9KXQ8I22MEgohj3Yt3gx1XZW2YLRH)3RFG)ZcQnroNT(N1sgJ4xOLPj)Q6gEOdWOMWNlURdQwtSDlNGpVUXEO37q)1(0rKirIEGNTYwiSlaXpjI0FgVtvnnxK3D)B)j7rxEKrgblRWU85Q56jJ94AOzyz4QZLfE4XTVh2Ozta8lnboy5F8avuJwAA07hF3cLwAHLlL1JsmYTWYtVVRdY0SOQl3BDB1aTfYYRo81g7COuUm1fLQlMPMyNJwcJGJQvFPcLkLTfCJnCmL3fHRXoTXDrYME61SK3e5Y96wwbKahE3aU4tu(p)RpFKrg9n(ST)UV)HYwkGyDjBdah5kurSqTxlBzSPmLtNJCMfEds2fv3dJSA6P)DjFqwlBl0rQa9t)cjk3GDrk2wQU7t)ukVsUE2nLnSwGehaGCDYnijitcppB)7iyO6CXu8pQsE(j5FecBZxX2dXN3WLYBnaSQz0K7qnmWvani7jh9l9j4fOBrVRg1ZvRqHk1CvKnrrNULH6H37bg38Z2EHYAl04lb2cHTKnxXxVw(aqCwJzuasjxKPgJZpiBvrXQLlvybXdOSIHVrwwtBz15YcQjLluBZwGzixnftzx3lq(1CzDbJi6Ia7OIwG8m6ykx)vxfS08mnSaH8YILkwPWHQ(mKiAhpHXvoqPLRN9M032z0hQ1YIzwflohp8Z0gyeEp4m(08ccS9m04xfjVrgqO7wxElK6JfcWORWtESav8vdPGmaJxHNWlBPYZa7Bompwy1msWwsIfEGiGcpDKfdf0Fb0YjgBmeHSuzp5AJX00)MVjOoIj8CMJW8Xgx9gXFPqcQZHeYARKlwF5Ssfbfs8Jhmd1aywZAnRbGlF8jNSyEElBpEDqMyIu53f5DSy6fVqriHa8x8HCmMEmEihp(Z9m2enFSh)0x(KBeF8b4ar4uFi1SX8gPNkXT4vT7x(gMXWEcjtAKmPqyCH9kz469yJNeVhjkg51cBXaVReMdoLC1ioFuilpj42b)Ajhjk5kPUleRWqr35mDnhx2rv2dczXE8wiIRnnqGYQgQE6zZaVs(rqmboYz5iJnXRvTL8bD9g(p357nshQLg5RzAnztxehxF8qA(NZOsHxiwK6FQjRGwBnrzCtKNHvtMV9ARTCXjRjBO2zBQHG0uZN6fEcjoPGp9Pd8zoDG)lpDGp7Pd85oDGFZth43ka8xgYAOUU92P9WTqD3ILzL6WK2YWS72OI5tNQ7RwSxHFTdEYpymJy(zxZ77Te8c1pZ2Q1Mnq4EppuSx2(uVHwqTeP5HKeifVyZKyrKxDgiwA2Daoe27cciEa)3y9Sl45lesMrPqx4rLvKkxSEoPpD5c1flwTs5m1UVqCWZF(PMdKxDPTa38W4K6KpCrq(yT5TEeBDy)E48aSd5By4CYjhuHWp5KuvsOJaLcSzQHscuOI51tAnyNIw1rkUGukv7CBUqTkwntcvtPgZlHW8cX7lbuyO6Q(8HccqPOtbJLjGclvsNsibqSX5Vo)CP4VXWbYp)rVa5hDLg36DJaE6qXv4CFa)EmYwAo7y9ONs3JygqzVrwzq0J7r6P6tS5lYrMYoUi10G1ltFe)yuTdHr78YKbizqjtGDtxpA)kbfTZb3(gX6IIJxs0987KQxIVTb5lu00MD2z1MtovQ5tLcYb))oIyiUp9bUHvWgHnKdQ4nS5qFFxhJ7GV8oGb)XZImg7yyl)BAtdl6102hHLchk5i10j1esWdVONuZ02gmh9VOFXCPcck1d1(oHdOyC21E9EWva9spHgFcIWrXBhrktAYro3tNG8JF152VDhcJn1rnrqPWgk0O9vTERl7roORov7TTicqz40yAvGuhrGEdk7C2wUiPEGzDCllwxozPLKq(zKF(H(fCWA)Obyh71YLW7CX2yLFjSDtmY1LpglKDCYLiF4ryOfP6DURJOxtNREDYf5iNNCHAk6iLnifb6iwhtJGsZhWodiokB)AkMGUtu2yDYLj)uYv4arWFNYlKvi8KQJnfH)GC2B2q2JVKDtk9tVk)26CDUFHk5QUmTZl)o(sW3DJcvYNGFPszEiSUwHflurkFX6zYwQq)BxOcBxIynQ5Uk5sJsU8OKY7e570P)c21LGViaAYKj71k1)q(0qUR(OgHo6FwmQI5)nqGgFGHGsHG7yPsFO7jwfl8vqH0G7aFx8pyyX08DcBn4NHyPZ9doov)wPSQkczA22Gr3qfb6LRCbqb)Vp5IgqV0L1O0r6EORVw5tG66ejE857uF1YnAQ6WSp0hWZyC7wOPLT215SYS1I(tjOSTk6lgX5dp2Uf8xqKj3Sm52yXQlrBtoRMTLNZzwaBSh)N2swL2BoVOi5wCK7S1(mxlO9yDMRb13fRFiDje)HoggDCWcO)5jiCRNfd1lUo5JPTttsZ()tG)xPMdWr7U(0EiR1pWBBquURgq1R3WF967RzI2XOHjcwb0dDSoN)ixDzigWd8hWruY7NL2Ae5xX5CLH3mKdgPyqhqqusm6up6FYfj)6NLb5hgb)mWiZqB3Suje5hqhIKGH6H0UJdgPraX9qFI7YJqMkkzAYmKuCKzpmgEr3zvMjM6CI7VTnwDvSSZ(RgSOMs75Lf9qFKeAWvAg7GuzDP9h((KjixJ8ECVACswsoGOi5hLuyNi)1(MZWGdBOJDev(0RrjBhAznc)FVjEbHV9ABxy8Pe(2Or9xcgclQtUlK25EK7h0J9ytqkTonc(FjNuoDzpABhjPJUYfAIiJQQTvzibNCtK)GbJDThvOw1kvflCT4HAXIQ5slmKbSjWXbb4Os63HXl1PgMV5WK(5VmO8Gt8qKsFYhMf1s(Kdn1QFyIp6CqoxLoj7HAmG09FeRgafiEjO7(NDRHiihJdtBLGzgKGxbmXTqMjGs0Sur44Tt64)vPbnxGsvO3AhP1ot1SPfQG2Mst9D(PA8FPfe6brbgU(ZYP9M0sv7sf5TTqTPKbiK(tjpqLUNoQ9edzYKD8f)Qz1ah4Wnoqlxu6T5UBgrPY1xukt(8vRWQ2tGRD9DqDGeerJ08lgHO7N(0p3cnPbK7iuUL(25SdSZZiBWsToxq2XpUtosoYwNNSnKMJSd53s(CYUrHG)SCa)EixWEKN3jp0Bclmi)o)ujHeioFWqSZ7MH6w3UYm7D78AvwPb5Qri7ZY(aPwPPXUnXyST(hp4)("
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