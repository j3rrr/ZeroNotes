local _, ZN, L = ...

local ZBMImportString = "!WA:2!TZZwWTrYXDq03Do4S9jrzjFNFD7T3rDaIGqeGI6K1zABcsqjAtcYdeuVOObxGDa29eWU7n7c(q6KRYSCLCLR6QkHLZz7KQCCysLV8x8N8zsPk2jvLp8umoXmVtKtQujFL6(iFKVs3Zm7Ifal4rrL4VcurGDNPNE6P7E6P7EMrXQnOw8bDlow6rtp(GnhuFq93ntU6u7nYn9c3OWJQyt1j0CAvVRo12X5K5AyEV7Pr1vkzB3WZ0zFTwEg20fC8mTTCJt3AHA1CjEx7RS2R)F)uWNTRtn1lTLdrT407jq2u2nSPF1yXInqrxhTQKNoBlAdNxYWZZX9kx4cBOv3oTP9fMFRfjuxBlTgtNB(lCzQwvExCPIUEAuV4vQzAz6Aeph8Jx8T9OM1RdWx4Cu5JVFopOBZP1IQ9i3wviRtS8wQvTAMBUx5PMCPsLxQ0KflvKxELRr0A4zu0sRjXn(2UoKgnMv3n(UvGgSKH9gly9qx(ptcuX6KCTGoTItdTTi0aKViLaiV4slMFU52vNGnfh40RLFUfNz552PLLKYIVNUP7B1YIJQSAnA4Ckn(ZLe1pVTo5h9u7v1UrRMwlHSOb(atlpcf4fxhgJaBy(TB5sMZSPjq0AnmRBvzQ8fkLVyoDIB1hDBc1wjNTRRcGkxkWWq0gJUUOXNIUPuk9h9N)5rH0tLRHTM(pH6P1aghzpBXMTazB8kI3plBS4fR2qZ1fFkhWCQIpSdqbL5fBKdeoeSmQPfO60YHxVZ6oTrqoQDdoi7QBcYGQqhSfVf1eYvbQnVhhM9Ri13eQkdmWaloaOEs1SmBQ5rmk6wfq8aBtT90WghRIqZYyxXV51RtCo1sVDlnkrzMwnAOCddtpYUusDaAuO8q9TazTzvo1kB1sqV)0fBGm1Ndq9gcoFfQMUzl3V1h7rvbTppnlVzak2MwP4Ktp7Ylj1PN1cyNXCEbqsytjYzd5rTI8uQn1DTkqRRzwp(dfWl4)VCfxstqOumdm7B0D9SRkLqVqSY)gQM6fhv525MFVAuqTCjpQMN2a7GZNUHPUNXZ9bAwvHPEZG1IJPklnvX85lSJgT6CeR6EgFRZMTLP(EJxQOHZBpwRBm9xy3AaZyktA1gK12t08fTbvl2W5CTPE7IApelDqkUlqV6MIj17i47WZxI9jMzFDygf(szC(f1LGq6YoDolBlYdjAUiPY7)NDB8nK0yKCn1mTMHvLPZonJWQ9SS6WppF3LSJlPrnojLT0cloy1Z)UV5UGrc6D5d5ZKREd7nm23JSPxMzSH5ZGiBC2OXypBm2xNn8(Cql6RvWEo2hlNjqERTtna4zAOv3LUWYLMB2c53flVCvF9Rb2bXzweNoNCgQ59uEZwA6ihxPujMjB4TROjnCnay4Y5KCsykaCyy1eeZiExA2PZVlVc(iOyXzV61k9qonjK33k2Jc6go1WEBwMFc7lemDYcmKqnyxelGno)7Vi)7lZ)ol)7j4FFf(3Vb)7lX)(lHF7CsaptQ)wTC9i6e95nTmyGgciYGbW(b9oY4YqXxBrj5aAXl39STBgdmx6zVgReQa(qo05T0Q0GOBiedbtihG9rypDX28VDRc9ODZsqt2m2q14g3STsuoL4FOH1KXvGpM1uqQPmXADfnl9GxsdZT8ikEgeloC4Ng2W8CfhQDDLj6cW0KnDmf6HLmBsugr5Qep8PejdAo0v82(LugTt8IFOeyOBP46H2SsxZMcA4juhkDnavd5QQKI32ukTPC8dPHlrjk8GG1gkl94()I)f9hNt1H6kA1p3KlxAbHgtjHSXjXSOLFWkj5otP56beBon6DwE2rA)2ilHnGDQFW5yd(FXoDfHO4de)CDnQjkbDDEH7ZjkD7LSBbm(juuRaRHRg)b7jGKpFEpo3TLJo8n7LzQSph7ZVFDIfHAwvSqi7ZYEX4SxIPW(0XzV3Mp9MbcByLmERDf8R4TfHKqYVqf7kjKAAaBnu5GQkxOgsOlmFUIQhuUW6M6Qk2uLmJk40Pd6CSv(p3TgxaA498cwao6qXWNG8OTiVr8WIYU(cWjjn3reoHgHwBv7Mv08KdJaDtq5ku7cAsyvwsAymccw3vaL8zNE1G66rfEKriPbl5aZAPL7M53bmpoKshKd(bMAOC3ukRRyAP4OzsDt0nfMe0P6OjYrYDv(gGsgypQyPc2Ee1EGbN)3tHRVsMvvIeulBpGKnGhbdsRSEFGI3(rc0H(IHLe90aKNQ03HENsuCfdGbsstBUY6RKD1v5Dx7xJSPaZdwsJu1lXyPqE)sCxlTQzNaBtYKk9Rvy1rwxKfssJ6arwfNV4RCKQVGGST0PV7HbWyR2)A5tm1v7pazgT)1fEQ0WCkzKm9h6dbrOiQ)1Az2iLsFRLp3)Wg(xmA5rY(iqcPNkmO0dC(2wI69WplxIjahYLverD4681YxyQfwg9(xestkL2fKVW0PuwCUjVf8CX8xnFHYtp7stMBU8DxC(c8slw1Gu9UvK2)pd7SSpf7f8xFWWuNuKlNzVsCyTM3hCC79y)6ai7alkGRi8EBgBTGLd4KxkLzHUkD60j7W4POsLja7dDr9cRecOHPbHamYHHa8oCKad9QUab8P39ALnSRe0Emm2lyGroaa4lCbNdbDyOOjc3QKhcWs9daX3)bhQOM382UrGseUK57W(nzFpqa8kNf57V5XNVdkjTzJ4qDcLEhehISqQ784ik6I1o6HlAGjUhr(x7f6dwx0VKiwGSptS8z0VkBiNbL(1kImFo76MvDseWQ9e4YhpOj7W(7Xo3p6PylUov6THbe7RlM0GjB0WyBmsNfSASLX2ousT83SyjEO8AUNy32o5CMhkIOKVSH7jyjM)rH8VN7DFfmOSUdSY4D)m7WdsEgGuD(Tdiy0NwkX1nLcN)Et5V3c(fH(MYFVLppkWlzeyW2CacuoVscrtG1AfvNmPp2IeWB5d4TsMmKUns5v4Xrm5a7O1WXqJhW47jkl3aIFVQSoC4SzSk9B8KsrN0WtRNin6vZKRk0NI7k2IJguHJabC6ySoDxRlNd1SQ3avSdZLYc)bXGyK2Xe9nlH8zLlOKThnw(Gf5YjeG5AcEFJ4mjuyMKxiBsazHyf(Mrc38djYe4Z(EunlxiUqIuCWZ1cj2(yyQb1zWJALlzwtiOkoGqVdB1(qWvAM1n8wclHVybOB2gZOW8eI0iHnDTICeT4hz00JNzB)SmKfZl5wX2HdIGwge0a4DYwdikwOv8mrOvqZKsPo8xf4pn4pAw4D4VkWFAzFs1t0O1ZeVhxZfIyAQ6PQ0vemqW9Exl)ntebA6reZBFQm9geIF9DmYcB2Q2ZY5PCoKHGrT5aSN)6qKHGLgxIh3cXFm7eCJg1E2pWpBBZAnd12YZG9hoWJcsXImpfpcc2S6D3AAPuXyNaa2n)MiAD3qBRI8ixnyx4u762QsrE22CV967lY5vzBEsqEo)xf5Fkl4Oo707aWlkwMGS2PMHN6pzEOlVUPRjemRHmTBLj61j5kyBr8latH4lFw2P3tMYJYWFV7zDEzKClZ)seQFzNYOv2YaPx1et5wSDcarDihrcEk7AOPBVr7ew)irP(5OI9TDonVemRjygYQYttvUjHx)arNzUjrKUUV5(IX7TePckgp7kLr74M12In8UI5xyu)5kSqH8SttbwccdpJsDNPQYycTy)yNbdrMsm)zFQok9MIshGN7NYBaCPBq1C2(gYh2paB85w)u5apuUb3B2cfWL65jZIxPuiSMZlgbxv8a773gXyUMEr5OxsnXCEP(jqKjM14D)KS)5by)fQdzX(zCEp7VK9Tz)vSFo7GVj7Vog7VHnm7VL93bwv(7z)dIms9pY(XS)Pp7tXEe7xW(xy)u2)6UcsFU8ZuI9VTg7F)fz)hXIGOT8jAcVtJac3aiqkY9XGI86KI2B2PwOqzrU6f0dqyvmiOvYXC(KvTTBaYmlunyAtxrM3kYZdhOu(i(0RCnG56yYIYo50t3D6(020GDt2TesXSHYpzLzlGPNKlaZiZP3A7kZIPVQvh(waOAxjw8RFpobCntDDIvXc5VE(I77N(BHLJWj78MX2HNJvxiQHCCrWxoy6mFiLrDOQsmYh)tWwynUTimP8w6bZ64TqqkYKvZkYwY5KTZ44YIWv(UQM6BF7CZRKtJ6Y(4GFrNRi31lNR0ojAtQRdgLUZniA3DsWeH7Dw0EdcL)48eDtT7WZoM7DQQ5LnTD96BRBxMJed2ZFUdI9rDgRdCTqh4QdmmPj9A2ulejhelUb7KNd8t)L2jImInYJ1he8UdLCP8LwEXicdvc(Jd2Jhpi)ocFRJdyqzYkvOK1n5g)D55eIVjzInmly9SPMM3M4IUELVWLhD0lJH)QoNP1DLjhi(dqeco0w1e4dFnYwOnPq4WvuZS42TeGSvuVkXTLRkISXh7YV(fhpLSCXo3TOTNOYlEPXg)Ixg7JoIkdqiyfccw4(HRHhEIF(hbcwbIoaZPA8NqjY0lOuyHskLwy5PU2)BirWCmfIv4E3wnAWhTQT1fVde88vZxA2cxDMItoF(7GPiUOMPEjW7ccoOqgA5lRMchNCmiXwvQTR7XdBVUaBCm4tB8nD74HUljjookK4RPTT1XdBJlWgIajU8OMCNKpE47Ic85JejoH57nTT0pEOCmbkL4WxEW3EUJhcZkfiCu4lraN9pEylJkxCaThNpjDRL7uhGTaJEPff5Us7jC6Rklm0Cn)a9Jo(92fdXSJZi7zpfej0aT3i2zg0DfXtze)KLhdy17cqYtdOIC3TsjZSx7KHeGZvMD6vdVDb83btB3)bVr4DPGVXuDbMaaH)74jdOJnnquCvyewNOhrnO7IWQOKiQchGygpWFakrvnCL(X1GJDaiF2apJmI8VYJsX)zS9ydnR2bwwxRrl)MNHNsRW16h3vFbWdCuTHS2S9uBxbf3pWeskOA5dDxVmx78FW6g7IxC0r7GkecxKdkFchTH0W5RFa)u46LN30TA53SfAB32AEWFJoyhT3pmUEYB4htOmT9QVIQq1P3Trexf0eAxMu9aBxBiICde4B6gmftnDAZiQhQbPcbUmvcPXgKJAKIxbMFHQJ069FdhJiQZWZQmiBkqm8auEDiudSSuk4iqvniUy5UJcECYBcQOnMsVr8kdjn49eE2wTAwHqtOo6MWGvIg)EjtQmjXeuK51tEHSJpEQJA7YMk7XQDJLASWTlU)g5AwlredWlLSVJWJ(aei0hxA8IpUnz8uxs2K(j7L5ans7PczmQcxUJn3RnaHvIx33ih3vP3iu5rzLRxsb9blmz4Nv5rgbtkDuUQHgztYtASu7YxhhAWSUCpVNZwdI5jHA(nlwsvk1q7FLVA6RJLLg31X0yacOvmE1bRATK26qFOktil4)ZkQyKdfjvjMWeg89BmzzOOYLYFZsQR2V08GwFuMqvvjY9Y9y3D8XbYq7DxFXECINSXr3BWuFzPDKZl)9o3pD1sQmkU93a5iDMX)aspc4JKO6oFAC1VmDvAZTkiwWCzqZbFmHQ4u5PMShiNetUEuNPaEw3fhNa17DV7PgMVe0SGrKSKj4G2bflTYlsypFUAu9w4e6l7u1irXCMUEDCUxCAyksWC4UifyWoPWPLEzDrQuIBJokjUstnVQgjuh6(M6xbmVm70PtRo0daSf10Uo2Df)9)x4)uOEgTN0W0IG2t49rDrN8AR81Vd9owRo8R1ZAJafHTOn1GEVCf1U2zCutlrIqakK89F)ZddR6Kq8sjdodb9EAqKBfdioIAh5bS1ttAVtoQRgvdsivt(gs9eSV7G651MS7URNz7rUJ)YzeymHDY6sSYqARossui2NgHm3zTwIunSMfwyjBOWerijsSYx)bRomhN9dP8KtUeWe7IGsm0MT)xsqftk0I6WIGcM24rCUmEmWRGD2ZwQ3fncIRdfvc9K(GbyLXsCR9DGG3b4pVdfy6VQAKJRdtzRlLcPAAK6aY4wKeq4neTFNMGdrZPeM(VoN423weKQhW7vysnNCRhEkiy0i9idDFomHvwI6qbfkOkeCXINkHtF0kb(8i70KRg6m0KPRZqJpmrFgmKAvh6C3(ZT5thrgf4vIl4cDcoxR)hqe8Z9Bp)kLpxlv7XAQaf6h0NtnseYWOk7qfk8Pc))sLF5lvost)pAdtuaZZTksKDlIdjz5c2dtUgIJhGVUwb9q51DPBWdHTBePgHE2raH2qhtl0oFhDIYwGz1vh(iHOFzO12MxMiGUpcSoEq7HiVG2cZpvgrbdQZV2dfprPU9HEOapsv290XAMw6jA7aAkjBbOx1J449XD65rDAQ6m8pQpi5)3WQ6xdFIM(lxYoW3Z2X6INMUV2gDgILOmUB19P8vKyC1drye)jvQC)qccWlZW()gE3zcOLuYhsf4Kf0K2oVHH4iLDkpizue4rIDkoiYHsvbFu0xlFrfSYkquKRoX6rcViat87HdfM5r5SA2b1govC9C4adLBd)dfAN5jjWt8WjlbluEi6GNMKs12k64cXQtPEf1opvA(gbdA8kzwn55V0Odhrnzxnzxuua2dtroYypvCwuZdVyAjJhL3Ly(DWDcl)vuA5suUpMs3rFakaNRL2iJNE0qTQMJgAGunr6rsQQKoDaQdbtdnxpGO0dseG0(FkfskLQAoy6Mfu2v4MXqCMsrE2A2WWeil3WQlygoXZOopj3y7XZRUAePCP35oa0jJmTfHOrYWT1J(qOr)w15X1cdn2hDFXjuEfzd7Ka7eNyYb7ez9zaOemc66WHXRUlLaPTQGTGmdpS)vuVlzlvFn5hKQJDDfhCHvzAGlMOy6rAg6ePkt)y1wukEYsbfdtXuBe6KDjQ8HAIj4OPVxPNooR1DpDucJyhFLhS2D0TllombRXU(af3apUo)jdIxgonpC3qigSv2B9KVLLBZ5(QBCR3cy0490JSM4(MnTaoIXE2utGa57(XUxBHIZE7fkuAY5yAF6ZXE)lXgCGTxxEzCOYnDOiFVygGksIQ7N(Che7tDPD57db)24KBrWvXdI9rpi2VY(IsriTinQmpiJj0TDO2oGmfHzB)dpYASN5hEYz22)O3uSbUPEStVhE5(OM8RMyoCbvN0FyRipYiJWVkPtNBE4XdI9jE6RtHjYO)lgStxXGOPtOhet9eul75jqVyaWmqnOkp761HHjamWDQAKfuuy)GCOxE7Idjf(ONQtQP1QHNFRoi2RDqSeWBjz)ohelf8W5DgCAH)Y4kPkOziQBVq)d9H(K4vusXgIUwP5wyG2iS)ba9im0bWVw2MABoroG55mawzwyTb4HZ)qoUvAWp1TSuoxY)E9GxKeLnmHExZXHapxHaATIQ854kMUkwe8a4GuZVhqnN56he7vnqICiK)CqSZXhKZGL8Yhe7LQ0KOB2QjuNZ5xg0eXeIQGjevXguTu4CD(ROpeRRz2GpbUduu0TjWtqmmFIsgaf0epenWiqthS5JoByG2kQqWVLrDq0reIKoh5BO5YDkXfNwbTbPIK9YE)DdyV4vCgiVaQfHTpJuGcpi24sIv15k5XTMd8QrrKpvO3AyBFxXEOzbIdGQTRPSLDlWsSHgEBVbrTcQQX7e2PzX33F6d)a1Tg7)KlbXd7O4aez8(Stx00YPLNGY)eq9Pak68f59jou2TIqcFMD4xXzmQk(zyvCARnIES8(yjt0jotY(9roYNBwUNYk8WiuMDA5rJb1cNefoF5ZCqSVc0SjnE3HO2T8WoK927jfhOptNG9RTzSFRaZK9C156oUgU7KD4CiVK2ProEqM2fjGfxrq1paTH0ho5dutf02RU0Y5kJoZLm6MzQlBZDSUJfFRbhzKzNMR04V)9Br8ISTVZ7ufAa8vY(unfRM2NQ7j5JPuhkJA7nTYCImPUC4fiK8PWep1d3OviYLWJyQhgwZkMRg5IFbbIfCRlKxT4dI9mSV7J68CEY(58dzwC2ZhNDsW09hFn8IyCRPkpLHMhgtzA8iWI2P5h6S5jUUA1jI)BciXRD78fxa9n61sgpUmiSJ(U60EXVJEBWZ(K4ycFS39OjEY2qRJFR5Q3Stv4CSb)j8dsU8QjXV1rYRPkEFuFX487J035rtDTjlvE(LUA5jNE6fkGYL)m)5yk(3qghUKqCqrsPixznfAnewwlypWfqnXeQ(cSUCqenOIkVtOwGSb)Eo2RNjhFgUQAuU40(cZ2EVS9PIPTTi(uYrZfPW46jJAp2TmD6osbspdZGDugNr(9yFF2ReN9Qz1S2cVInoFMq2t79KiZsmV8sYu7z53rg8yVZVKm9uYZ3Dj54NZAp2FACwMljVN9J3(22dlYDM978CwVxOX1jyWYGQmT4oVsKuyNNa9byM0slSiEuz32)CAZ(fu5re)GyXexlFvt9hgMxUFxN(BWfw8iadUS(2Ax9T9CNFQBVrt2IXz)QIZK8OX2R7J1(UTpM6FRpMZl3FA1)WzZEM4dU(p7M)p"
local ZBMWagoUrl = "https://wago.io/ssH2QdjlK"
local ZNDImportString = "!WA:2!fJvZZTTXvCjXX1jyY0AP04joXTgbTYM0MKMs2s2r1SXIFijAlsPacjzBjBkqGfeWgeazbGKO)invtMmEApfFSh15CI)d0o(q71D00d9SNPx6HoDYPESVDb43soXsPt4bcGD33BFV3(EV937n8QJ5kELKPso1y1htDm1NF29RkR8ivSTtwBtB8TIejYYrGPFvvBSkcNjCsNtLX04XpwgRYlzBB6z4SVSVNUnEjhpdBlxUQbRxh3yjnnxK3c3u5)8p)IHgAK9WOAWkKA4GeRHT9D2lyLLnEm6endEpyRhE4HJSNNTYwiSlqX7pCLVw0vr2efblRW2LPfD9KXECzmSm84QQbpC1521dBuRgq0hCEC4RF1EQOQ(AA0DfVq(fxEUvwmJhveK9XYtURRdY0SGQl3RC9RI2cz5vgwTXonRKD2YsvklnROu7PwgJGPelVC(fxmJpSZvDmLBGWISzRUas20tx0sUoYL7f(wHIaxOEMxTgYz0YFMVmgXpNVPj)A6gEOxgmBGX6TBkBPagZLTnagMnFjP8IVq2YOUmvTNM8ZMJC6mw2wOxIKDrL9WiRAE6NCFvqzOROcv1WUifBlv3DPRHQ4KyzQlByb0sIrU4jjxIeNKaED0(hrWq15mP4VxPC8j4VhcBZxY2dXNZWLQOHNrfSabnstnmONGei7jh5BdK65Odr3WQLZkMpFj8oHUa)L)O9iRm0qdvfKlnJACFlODiSLS5QbNWf3dmXIm3dWY5Im1ygG9YSKK0sfxm)Cs7r1iJapSmM2YQtNbo6uoTyDFWhKtuXu2190K0CzCb3j6lt6BO28w3X4AF22ZvuBUQJPCXN)Rb3optdlWCVI0IfkLNC1f(Z)7R(FbrBOMQbAPeAhpHXv2tX31ZUo9RDg5UA(wmhVOX44HFM2G3iVhmhFAEbb2ygA8RHKF0SWjHBz5TqQRleYrxH7VUa1MkIuqgGtTW95LTu5zK99NM1fwB2kWqvKYFhjGfE6ilglO)cLLJm3ymczPYEY1IJPP)ntn4WjQWtyHkZeDC1lf7zcXPHpvqwBLC(YRKPsb44j2btMHAinByTH1a0LlwIefYXBz7XRd2etKkFdK3bYPN(ufH4cWFXoKPX0PXhY0J)epJ6OzIU(dE29VuSXhqdKGzdOuZgZBKEI4xNx1UF7B3kg2tizsJKjf6MxyVfnC9w34(X6XIIrE(ylg5DSWCWS77QlRAV9Ddcuo7qKZtUGZP647TIJQShKbJ94vqMwBAQaL1mu90Zml8j5Nczf4iN68Vq1UsaDBwn45oVLsIefLT8LnnBWRyIKXuNgQXgXVTHN(m8xg7BD0DAsdU(CTvDAI2AP1KnDrDnAGbjn)tyQSWtLkqd91KvqBSHKmUgYZWQglXXgBSsHeIYgQThM6vvzIzs9upH4hvYN84r(voEKF1Jh5tD8iF6Jh5x74r(1dj)zD5nuw3E70EyFuNHyxKtJ(sBzy2zyuHCPt15tl2NWVwzI5hmbu0GlZZfe6f(bnO12YVEveU357kroBCA0MpCZCAE4(hKIx0ReFEKxzgjwA2TjUlU3HeW8ajdI2ZOqAeHUSzuj0fEuA1kfluoBLpDL8LLkSuPIZkEBHyqAKzMyAWE1r2cZz0npPzmoCtqUOT0TEmBTv)E08qUdrWmEMiXGhi8jsqps6Ak4qbgm1HkcuQI61ZDKWifSkJuCbRuQwxu6cqJSQLeGTPg1lUWmcX672SUPQZXxavqcqfDkzSRvO0sT0PeIdcBm(lYpDk(lD4efCzuVefKQMM36ntaEWHYRUVif03dW2sbaeTNZP09yMbw2BMvgf9eEKEI(mBbMCKPSJlsnn49YopIDahThII2(JeHmzqltOFtNi6aSMs2zHD)rr7WId2s0z(BKQxHVLd5tv00MAQP0MwovQzsLcUq)hoH4qcF6JCdRWb62roetD3Ud9TU2o3HR8gGd)bRImf7auRGDQUHfDBAfJyJb)na)sQjtQjeNh(qpPMPTn4ogSrxE6uHjL6rAFJ4ba3NTTxShEfkV0zO5NGmCu(22KYSMCKr5iJ9GZtE3N)UoJ67IQudb4RnuOP6xYAZ975Zx5YEKfQCeq9yr(qYzFblbxj4EKHHQrks(ioatcRGQmu4o72Q0MXMGCgYhqoNZzArn)Yy7AyKRlFuwA6yndW9WkcQk4R757UpgkkRC7DyFQa2Ed3Ku0jAB3HqS9d4Bbsmvvj)CY7jQOJuEePa59H67aobv)O8Onj)cYVKiWbMG)ktdwJCoYkG4EU9YAxVQSh)I21ORPL4PBOIifdkP01525lLDPvOf6fuTzC(odKVuU48lV4S3fExm)85lvjxHYZMzX89pC(sSrjf3z4Fs7AvyBqC(cWItMmzVoPbtYNgU6QV9xO9XplfvHCFoKNjGyiNux0DGYva19KQIL9keuoenW3H)dMvmnF7SwdUme728GCJt0VtkdurxEMKpCeYzgHuwKMmGD4reGdhN)1r38aNgDupQSKUhz770gfEiDKmrb6EQxVTJEBDxMaAfTpKPTBHMu2QHZOYS3Lc6lrrBv03mKZh2vDVvcYuuXj8fIcz6IKOb9DO3EhK87UBcz0ST8Co1CyJhZ)P(YQ0wfWljrUgh53O1Kg)ajNOncsNfmrd6X6KFlT4DYnO)JdNhE)8K3EZmyaJ5MKpb(CvrhqTBS5KEiRn3ZBBWE3qduTnRg8(M7QzI2XOQjcEdKcApMEVWATUtqTwriVvgA9y7PzSdsLvq1x(oo)Qd0Aq9HQ4Grkg0UveX5Jo8vP2WsUUHIo(HqWUHwJm0UxqEhApSemuBsRNkSDkKB2mkEE3PuUsu1PLiteHmj5kKtUWnxzO)gTHeKP42DBBS6AyzNDxl8frLwnNlsZa1PtlZiZWrUowAPLzB5j4E(4KmKSKtCr4GPPkYvbBW6rhXt0ToutizlNNjzd3g0tfIxMMEQtDIoM0UiXtRtugwQc2oS0rUJFTJIBtT6NqJC6QE21QzIWGFqoqq1N8rOgIm5bRI0K9nHQDP9vZz8SmHKjAqoBiZQHfnM7YyZGhiAZHiF1ji5gHKFNH)t915MbBFt7ij6HzVHLSrOy7e()EBree(XRricJpHWpcT(GCYHPD7GSaCF6Ti3oSrgJs7Lbzr4Q5Dgz1bAFXpyDTiBLS6YE0c7ss77OluM2SQQ2wfb4eY1qbD6n6fUxEXLkTKu(leRRIyPUfPfoKMKc8gU)GEm(g0nW2Oe)(tt6N8SqayhDdXrV3J0WKJo10qQxR5RTPoOFXRlWo9dnuhRtEQBjzSsTXQXGus4ParzyeOq5EFoaekdf3MVk7cZkvPy55RmBUClvIIV6F0bWyicchMZsCMlECEfi81czghWGBPIWXAbPiyvPbhNqFkHEloGwCe1XkTqj02utsFZFSAwCAbHEyuyqzqZ6AniTwKosroBluljzabPFqxdukZXtApYuMmz78mVEvnm5u3vgsQaWDe4iiIgP23merpa9Z1j7smipKHAz6aCjHyu(e2)EVhXhWsq2I0qNSteY8NDOqetasikGOUqm13iJoWiWn4pM8K2WfEz3klGqOzxk7im4cFo53rM60K)GoGM46FCPR84poNwPvRs(9bic2(lFhYvhM8fmadJT1F)o)Vd"
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