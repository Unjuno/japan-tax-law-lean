import JapanTaxLaw.TaxFinance

/-!
# DisasterExciseTaxCredit — 災害被害者に対する租税の減免等に関する法律 art. 7(1) 被災酒類等の税額控除（bounded slice）

Sources (pinned):
  Law id: 322AC0000000175
  Revision: 322AC0000000175_20220101_503AC0000000011
  Raw snapshot: data/raw/322AC0000000175_20220101_503AC0000000011.law.json
  Normative id: NORM|d595659fb5709f6f1f3a41fb663587388f803cd980d1ede371062ebb1f215def
  Article Num 7, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「酒類又は製造たばこ、揮発油、石油ガス、原油、ガス状炭化水素若しくは石炭の製造者（石油ガスについては石油ガスの充てん者とし、原油、ガス状炭化水素又は石炭については原油、ガス状炭化水素又は石炭の採取者とする。以下この条において同じ。）又は販売業者（石油製品の販売業者を含む。以下この条において同じ。）が販売のために所持するこれらの物（石油製品を含む。）で酒税又はたばこ税、揮発油税、地方揮発油税、石油ガス税若しくは石油石炭税を課せられたものが災害により亡失し、滅失し、又はその本来の用途に供することができない状態になつた場合においては、政令で定めるところにより、当該災害により亡失し、滅失し、又はその本来の用途に供することができない状態になつた酒類又は製造たばこ、揮発油、石油ガス、原油、石油製品、ガス状炭化水素若しくは石炭（以下「被災酒類等」と総称する。）について課せられた酒税又はたばこ税、揮発油税、地方揮発油税、石油ガス税若しくは石油石炭税（以下「酒税等」と総称する。）の税額（延滞税、過少申告加算税、無申告加算税及び重加算税の額を除く。）に相当する金額（被災酒類等について当該製造者又は販売業者が保険金、損害賠償金等により損失を補塡されたときは、その補塡された金額に応じ政令で定めるところにより計算した金額を控除した金額）を当該被災酒類等に係る酒税等の納税義務者がその災害のあつた日以後において納付すべき酒税等の税額から、それぞれ控除する。」

Computation（単位: 円。控除額 = 酒税等の税額 - 政令計算による補塡控除額、Nat 飽和）:
  credit(taxAmount, offset, disasterLoss) =
    if disasterLoss then taxAmount - min offset taxAmount else 0
  applied(taxDueAfter, credit) = taxDueAfter - min credit taxDueAfter

Scope / NOT MODELLED:
  - 政令で定める補塡額の計算方法、他の税目・納税義務者の認定、延滞税・
    加算税の取扱い、適用手続は NOT MODELLED。
  - のちの納付税額への控除は上限計算の計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.DisasterExciseTaxCredit

/-- 被災酒類等に係る税額からの控除額（保険金等による補塡分を控除、下限 0）。 -/
def disasterCredit (taxAmount : Nat) (offset : Nat) (disasterLoss : Bool) : Nat :=
  if disasterLoss then
    let deduction := if offset < taxAmount then offset else taxAmount
    taxAmount - deduction
  else 0

/-- 災害後の納付税額から控除する金額（下限 0）。 -/
def appliedCredit (taxDueAfter : Nat) (credit : Nat) : Nat :=
  let deduction := if credit < taxDueAfter then credit else taxDueAfter
  taxDueAfter - deduction

example : disasterCredit 100 40 true = 60 := by decide
example : disasterCredit 100 150 true = 0 := by decide
example : disasterCredit 100 40 false = 0 := by decide
example : appliedCredit 50 60 = 0 := by decide

end JapanTaxLaw.DisasterExciseTaxCredit
