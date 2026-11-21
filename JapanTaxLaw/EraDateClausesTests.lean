import JapanTaxLaw.EraDateClauses
import JapanTaxLaw.EraDateClausesSpec
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-!
# EraDateClausesTests — 元号日付パーサの代表variant検証
-/
namespace JapanTaxLaw.EraDateClausesTests

open JapanTaxLaw.EraDateClauses

example : parseEraDate "令和七年七月三日から令和十二年七月二日までの期間" = some (.reiwa, 7, 7, 3) := by decide
example : parseEraDate "令和七年八月六日からの大雨並びに令和七年台風第十二号及び第十五号のため農地利用効率化等支援交付金を受けて実施する事業に要する経費として総務大臣が調査した額に〇・七を乗じて得た額" = some (.reiwa, 7, 8, 6) := by decide
example : parseEraDate "令和七年十一月二十八日" = some (.reiwa, 7, 11, 28) := by decide
example : parseEraDate "令和七年十一月十八日大分県大分市に発生した火災について、第三条第一項第一号ロの表第三号に規定する算定方法に準じて算定した額。" = some (.reiwa, 7, 11, 18) := by decide
example : parseEraDate "令和七年十二月一日" = some (.reiwa, 7, 12, 1) := by decide
example : parseEraDate "令和三年九月一日" = some (.reiwa, 3, 9, 1) := by decide
example : parseEraDate "令和三年六月二十八日" = some (.reiwa, 3, 6, 28) := by decide
example : parseEraDate "令和三年六月二十四日から令和十三年七月七日までの期間" = some (.reiwa, 3, 6, 24) := by decide
example : parseEraDate "令和三年六月五日又はこの法律の公布の日のいずれか遅い日" = some (.reiwa, 3, 6, 5) := by decide
example : parseEraDate "令和三年十一月一日" = some (.reiwa, 3, 11, 1) := by decide
example : parseEraDate "令和三年十一月二十六日の閣議決定「令和三年度一般会計新型コロナウイルス感染症対策予備費使用について」に基づき使用される予備費又は令和三年度の一般会計補正予算（第１号）における子育て世帯等臨時特別支援事業費補助金を財源として市町村又は特別区から給付される給付金" = some (.reiwa, 3, 11, 26) := by decide
example : parseEraDate "令和二年一月二日から同年七月二日までの間に被災住宅用地の全部又は一部を取得した者" = some (.reiwa, 2, 1, 2) := by decide
example : parseEraDate "令和二年三月三十一日" = some (.reiwa, 2, 3, 31) := by decide
example : parseEraDate "令和二年九月十七日から令和七年九月十六日までの期間" = some (.reiwa, 2, 9, 17) := by decide
example : parseEraDate "令和二年六月二十一日" = some (.reiwa, 2, 6, 21) := by decide
example : parseEraDate "令和二年十一月三十日" = some (.reiwa, 2, 11, 30) := by decide
example : parseEraDate "令和二年十一月二日" = some (.reiwa, 2, 11, 2) := by decide
example : parseEraDate "令和二年四月一日" = some (.reiwa, 2, 4, 1) := by decide
example : parseEraDate "令和五年二月一日までの間において政令で定める日" = some (.reiwa, 5, 2, 1) := by decide
example : parseEraDate "令和五年十二月三十一日以前に贈与により取得した相続税法第二十一条の九第三項の規定の適用を受けた財産に係る新相続税法第四十九条第一項（第二号に係る部分に限る。）の規定の適用については、同号中「第二十一条の十一の二第一項の規定による控除後の贈与税」とあるのは、「贈与税」とする。" = some (.reiwa, 5, 12, 31) := by decide
example : parseEraDate "令和元年七月一日" = some (.reiwa, 1, 7, 1) := by decide
example : parseEraDate "令和元年七月十六日）" = some (.reiwa, 1, 7, 16) := by decide
example : parseEraDate "令和元年九月三十日" = some (.reiwa, 1, 9, 30) := by decide
example : parseEraDate "令和元年六月二十五日）" = some (.reiwa, 1, 6, 25) := by decide
example : parseEraDate "令和元年十二月十六日）" = some (.reiwa, 1, 12, 16) := by decide
example : parseEraDate "令和元年十月三十一日" = some (.reiwa, 1, 10, 31) := by decide
example : parseEraDate "令和八年七月十日" = some (.reiwa, 8, 7, 10) := by decide
example : parseEraDate "令和八年五月二十一日。以下「施行日」という。）" = some (.reiwa, 8, 5, 21) := by decide
example : parseEraDate "令和八年六月一日" = some (.reiwa, 8, 6, 1) := by decide
example : parseEraDate "令和六年三月一日又は戸籍法の一部を改正する法律（令和元年法律第十七号）附則第一条第五号に掲げる規定の施行の日のいずれか遅い日" = some (.reiwa, 6, 3, 1) := by decide
example : parseEraDate "令和六年五月二十七日" = some (.reiwa, 6, 5, 27) := by decide
example : parseEraDate "令和六年五月十五日から令和八年五月十四日まで" = some (.reiwa, 6, 5, 15) := by decide
example : parseEraDate "令和六年十二月二日" = some (.reiwa, 6, 12, 2) := by decide
example : parseEraDate "令和六年十月一日" = some (.reiwa, 6, 10, 1) := by decide
example : parseEraDate "令和六年四月三十日までに取得された旧法附則第十二条の二の十三第四項及び第五項に規定する自動車に対して課する自動車税の環境性能割については、なお従前の例による。" = some (.reiwa, 6, 4, 30) := by decide
example : parseEraDate "令和四年一月一日" = some (.reiwa, 4, 1, 1) := by decide
example : parseEraDate "令和四年一月四日" = some (.reiwa, 4, 1, 4) := by decide
example : parseEraDate "令和四年五月一日" = some (.reiwa, 4, 5, 1) := by decide
example : parseEraDate "平成七年一月十七日から阪神・淡路大震災の被災者等に係る国税関係法律の臨時特例に関する法律の一部を改正する法律（平成七年法律第四十八号）の施行の日の前日までの間に同法附則第五条第一項各号に掲げる事実が生じたことにより、当該各号に定める利子、収益の分配又は差益について第七十一条の十第二項の規定により徴収された利子割の額があり、かつ、当該事実が阪神・淡路大震災によつて被害を受けたことにより生じたものである場合において、当該徴収された利子割の額がある租税特別措置法第四条の二第一項に規" = some (.heisei, 7, 1, 17) := by decide
example : parseEraDate "平成七年一月十六日以前に相続又は遺贈（贈与者の死亡により効力を生ずる贈与を含む。以下この条及び第三十一条において同じ。）により財産を取得した者があり、かつ、当該相続又は遺贈に係る相続税法（昭和二十五年法律第七十三号）第二十七条第一項の規定により提出すべき申告書の提出期限が同月十七日以後である場合において、その者が当該相続若しくは遺贈により取得した財産又は贈与（贈与者の死亡により効力を生ずる贈与を除く。以下この条から第三十一条までにおいて同じ。）により取得した財産（平成六年一月" = some (.heisei, 7, 1, 16) := by decide
example : parseEraDate "平成七年九月一日" = some (.heisei, 7, 9, 1) := by decide
example : parseEraDate "平成七年四月十四日）" = some (.heisei, 7, 4, 14) := by decide
example : parseEraDate "平成三十一年一月七日" = some (.heisei, 31, 1, 7) := by decide
example : parseEraDate "平成三十年六月十五日" = some (.heisei, 30, 6, 15) := by decide
example : parseEraDate "平成三十年十月三十一日" = some (.heisei, 30, 10, 31) := by decide
example : parseEraDate "平成三年十一月十二日までに行われる旧法附則第三十二条の三第四項に規定する施設に係る事業所用家屋の新築又は増築に対して課すべき新増設に係る事業所税については、なお従前の例による。" = some (.heisei, 3, 11, 12) := by decide
example : parseEraDate "平成三年十二月四日までに終了する事業年度分までの旧法附則第三十二条の三第二項に規定する事業に対して課すべき事業に係る事業所税については、なお従前の例による。" = some (.heisei, 3, 12, 4) := by decide
example : parseEraDate "平成三年十月一日" = some (.heisei, 3, 10, 1) := by decide
example : parseEraDate "平成九年六月十二日）" = some (.heisei, 9, 6, 12) := by decide
example : parseEraDate "平成九年十一月十一日" = some (.heisei, 9, 11, 11) := by decide
example : parseEraDate "平成二十一年一月五日）" = some (.heisei, 21, 1, 5) := by decide
example : parseEraDate "平成二十一年七月二日から公表日の前日までの間にその境界に変更があった都道府県に対する新地方税法施行規則第七条の二の十二の規定の適用については、同条中「当該従業者数が公表された後」とあるのは、「同年七月二日以後」とする。" = some (.heisei, 21, 7, 2) := by decide
example : parseEraDate "平成二十一年六月二十二日）" = some (.heisei, 21, 6, 22) := by decide
example : parseEraDate "平成二十一年十二月十五日）" = some (.heisei, 21, 12, 15) := by decide
example : parseEraDate "平成二十七年五月二十九日" = some (.heisei, 27, 5, 29) := by decide
example : parseEraDate "平成二十七年四月二十五日から平成三十二年四月二十四日までの期間" = some (.heisei, 27, 4, 25) := by decide
example : parseEraDate "平成二十三年三月十一日から震災特例法の施行の日の前日までの間に震災特例法附則第三条第一項各号に掲げる事実が生じたことにより、当該各号に定める利子、収益の分配又は差益について第七十一条の十第二項の規定により徴収された利子割の額があり、かつ、当該事実が東日本大震災によつて被害を受けたことにより生じたものである場合において、当該徴収された利子割の額がある租税特別措置法第四条の二第一項に規定する勤労者が、政令で定めるところにより、平成二十四年三月十日までに、当該徴収された利子割に係る" = some (.heisei, 23, 3, 11) := by decide
example : parseEraDate "平成二十三年三月十日以前に相続又は遺贈（当該相続に係る被相続人からの贈与（贈与をした者の死亡により効力を生ずる贈与を除く。以下第三十八条の五までにおいて同じ。）により取得した財産で相続税法（昭和二十五年法律第七十三号）第二十一条の九第三項（租税特別措置法第七十条の三第一項において準用する場合を含む。以下この項において同じ。）の規定の適用を受けるものに係る贈与及び贈与をした者の死亡により効力を生ずる贈与を含む。以下第三十八条の五までにおいて同じ。）により財産を取得した者があり、" = some (.heisei, 23, 3, 10) := by decide
example : parseEraDate "平成二十三年五月十三日）" = some (.heisei, 23, 5, 13) := by decide
example : parseEraDate "平成二十三年八月一日）" = some (.heisei, 23, 8, 1) := by decide
example : parseEraDate "平成二十三年十二月三十一日以前に支払決定又は充当をした第三条の規定による改正前の相続税法（以下附則第二十条までにおいて「旧相続税法」という。）第三十三条の二第六項の規定による還付金に係る還付加算金については、なお従前の例による。" = some (.heisei, 23, 12, 31) := by decide
example : parseEraDate "平成二十三年四月二十一日における地方税法附則第五十一条第四項に規定する警戒区域設定指示区域（以下この条において「警戒区域設定指示区域」という。）であって同年三月十二日において同法附則第五十五条の二第一項第二号に掲げる指示（避難のための立退きに係るものに限る。）の対象区域であった区域は、同法附則第五十一条第四項及び第五項、第五十二条第二項及び第三項、第五十四条第二項、第三項及び第七項、第五十六条第十三項から第十五項まで並びに第五十七条第四項から第九項まで及び第十三項の規定の適用" = some (.heisei, 23, 4, 21) := by decide
example : parseEraDate "平成二十九年十二月二十八日から令和十年二月二日までの期間" = some (.heisei, 29, 12, 28) := by decide
example : parseEraDate "平成二十九年十月二日" = some (.heisei, 29, 10, 2) := by decide
example : parseEraDate "平成二十九年十月八日" = some (.heisei, 29, 10, 8) := by decide
example : parseEraDate "平成二十二年二月二十一日" = some (.heisei, 22, 2, 21) := by decide
example : parseEraDate "平成二十二年二月二十二日" = some (.heisei, 22, 2, 22) := by decide
example : parseEraDate "平成二十八年三月二十九日）" = some (.heisei, 28, 3, 29) := by decide
example : parseEraDate "平成二十八年五月三十一日までの間において政令で定める日" = some (.heisei, 28, 5, 31) := by decide
example : parseEraDate "平成二十八年五月二十一日" = some (.heisei, 28, 5, 21) := by decide
example : parseEraDate "平成二十八年五月二日" = some (.heisei, 28, 5, 2) := by decide
example : parseEraDate "平成二十六年一月二十日）" = some (.heisei, 26, 1, 20) := by decide
example : parseEraDate "平成二十四年一月二十五日" = some (.heisei, 24, 1, 25) := by decide
example : parseEraDate "平成二十四年七月九日）" = some (.heisei, 24, 7, 9) := by decide
example : parseEraDate "平成二十四年三月十九日" = some (.heisei, 24, 3, 19) := by decide
example : parseEraDate "平成二十四年二月二十三日）" = some (.heisei, 24, 2, 23) := by decide
example : parseEraDate "平成二十年一月三十一日" = some (.heisei, 20, 1, 31) := by decide
example : parseEraDate "平成二十年一月四日" = some (.heisei, 20, 1, 4) := by decide
example : parseEraDate "平成二十年十月二十一日）" = some (.heisei, 20, 10, 21) := by decide
example : parseEraDate "平成二十年四月三十日までの間において政令で定める日" = some (.heisei, 20, 4, 30) := by decide
example : parseEraDate "平成二年一月二日から平成四年一月一日までの間に新築された旧法附則第十六条第六項に規定する住宅に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 2, 1, 2) := by decide
example : parseEraDate "平成二年八月二十五日）" = some (.heisei, 2, 8, 25) := by decide
example : parseEraDate "平成二年六月二十九日に採択されたオゾン層を破壊する物質に関するモントリオール議定書（以下「議定書」という。）の改正が日本国について効力を生ずる日（以下「議定書改正発効日」という。）（議定書改正発効日が平成四年七月一日後となる場合には、政令で定める日）" = some (.heisei, 2, 6, 29) := by decide
example : parseEraDate "平成五年九月二十八日）" = some (.heisei, 5, 9, 28) := by decide
example : parseEraDate "平成五年八月九日）" = some (.heisei, 5, 8, 9) := by decide
example : parseEraDate "平成五年八月二日）" = some (.heisei, 5, 8, 2) := by decide
example : parseEraDate "平成五年六月二十五日）" = some (.heisei, 5, 6, 25) := by decide
example : parseEraDate "平成五年四月二十八日から平成十一年三月三十一日までの間に取得され、又は改良された旧法附則第十五条第四十五項に規定する線路設備等に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 5, 4, 28) := by decide
example : parseEraDate "平成元年三月十六日" = some (.heisei, 1, 3, 16) := by decide
example : parseEraDate "平成元年九月三十日において現に旧法の規定により元売業者の指定を受けている者（以下この条において「旧元売業者」という。）で同年十月一日において前項又は新法第七百条の六の二第一項の規定による元売業者の指定を受けていないものに係る旧法の規定による当該元売業者の指定は、同日から平成二年三月三十一日までの間に限り、同項の規定による元売業者の指定とみなす。" = some (.heisei, 1, 9, 30) := by decide
example : parseEraDate "平成元年四月一日" = some (.heisei, 1, 4, 1) := by decide
example : parseEraDate "平成八年七月二十日）" = some (.heisei, 8, 7, 20) := by decide
example : parseEraDate "平成八年九月十三日" = some (.heisei, 8, 9, 13) := by decide
example : parseEraDate "平成六年十一月十六日" = some (.heisei, 6, 11, 16) := by decide
example : parseEraDate "平成十一年二月十六日）" = some (.heisei, 11, 2, 16) := by decide
example : parseEraDate "平成十一年五月二十日" = some (.heisei, 11, 5, 20) := by decide
example : parseEraDate "平成十一年十一月一日から平成十八年三月三十一日までの間に新たに取得された旧法附則第十五条第四十四項に規定する施設に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 11, 11, 1) := by decide
example : parseEraDate "平成十一年十一月二十五日から平成十九年三月三十一日までの間に新設された旧法附則第十五条第二十三項に規定する施設に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 11, 11, 25) := by decide
example : parseEraDate "平成十一年十一月十九日" = some (.heisei, 11, 11, 19) := by decide
example : parseEraDate "平成十七年七月十七日）" = some (.heisei, 17, 7, 17) := by decide
example : parseEraDate "平成十七年三月七日）" = some (.heisei, 17, 3, 7) := by decide
example : parseEraDate "平成十七年二月十七日前において旧法第七百条の十五第一項の規定により免税証の交付を受けた旧規則第十八条の三第四項に掲げる旧法第七百条の十五第一項に規定する免税軽油使用者が、この省令の施行の際、当該交付を受けた免税証のうち当該免税証の交付を行った道府県に係る旧法第七百条の十一の三第三項に規定する登録特別徴収義務者又は当該免税証に係る旧法第七百条の十五第八項に規定する免税取扱特別徴収義務者である者以外の軽油の販売業者に提出していない免税証を所持しているときは、当該免税軽油使用者は、" = some (.heisei, 17, 2, 17) := by decide
example : parseEraDate "平成十七年四月十三日又は公布の日のいずれか遅い日" = some (.heisei, 17, 4, 13) := by decide
example : parseEraDate "平成十三年一月六日" = some (.heisei, 13, 1, 6) := by decide
example : parseEraDate "平成十三年三月三十一日" = some (.heisei, 13, 3, 31) := by decide
example : parseEraDate "平成十三年九月十日）" = some (.heisei, 13, 9, 10) := by decide
example : parseEraDate "平成十三年五月十八日。以下「施行日」という。）" = some (.heisei, 13, 5, 18) := by decide
example : parseEraDate "平成十三年八月二十四日から平成十七年三月三十一日までの間に新設された旧法附則第十五条第十二項に規定する緑化施設に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 13, 8, 24) := by decide
example : parseEraDate "平成十三年十一月十三日" = some (.heisei, 13, 11, 13) := by decide
example : parseEraDate "平成十九年一月九日）" = some (.heisei, 19, 1, 9) := by decide
example : parseEraDate "平成十九年七月十六日から施行日までの間に取得され、又は改良された旧法附則第十六条の二第七項に規定する償却資産に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 19, 7, 16) := by decide
example : parseEraDate "平成十九年三月二十五日から施行日までの間に取得され、又は改築された旧法附則第十六条の二第四項に規定する家屋に対して課する固定資産税については、なお従前の例による。" = some (.heisei, 19, 3, 25) := by decide
example : parseEraDate "平成十九年五月十五日" = some (.heisei, 19, 5, 15) := by decide
example : parseEraDate "平成十九年八月六日）" = some (.heisei, 19, 8, 6) := by decide
example : parseEraDate "平成十九年十二月十日）" = some (.heisei, 19, 12, 10) := by decide
example : parseEraDate "平成十九年四月十六日" = some (.heisei, 19, 4, 16) := by decide
example : parseEraDate "平成十二年三月二十一日" = some (.heisei, 12, 3, 21) := by decide
example : parseEraDate "平成十二年二月一日" = some (.heisei, 12, 2, 1) := by decide
example : parseEraDate "平成十二年六月三十日" = some (.heisei, 12, 6, 30) := by decide
example : parseEraDate "平成十二年十一月三十日。以下「施行日」という。）" = some (.heisei, 12, 11, 30) := by decide
example : parseEraDate "平成二十九年四月一日" = some (.heisei, 29, 4, 1) := by decide
example : parseEraDate "昭和四十二年六月一日" = some (.showa, 42, 6, 1) := by decide
example : parseEraDate "令和元年十月一日" = some (.reiwa, 1, 10, 1) := by decide

theorem effective_spec (d : Nat) :
    effectiveDate d = JapanTaxLaw.EraDateClausesSpec.effectiveSpec d := by rfl

example (d : Nat) : effectiveDate d = d := effective_identity d

end JapanTaxLaw.EraDateClausesTests
