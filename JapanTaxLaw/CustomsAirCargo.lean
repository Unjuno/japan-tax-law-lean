import JapanTaxLaw.TaxFinance

/-!
# CustomsAirCargo — 関税定率法 art. 4の6（航空運送貨物等に係る課税価格の決定の特例）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the two substitution rules of art. 4の6 — pinned bytes 逐語:

  1項: 「…当該輸入貨物が航空機により運送された貨物であるときは、これらの貨物のうち、
        無償の見本（航空機による運賃及び保険料により計算した場合の課税価格が少額である
        ものとして政令で定める額を超えないものに限る。）又は災害の救助、公衆の衛生の
        保持その他これらに準ずる目的のため緊急に輸入する必要があると認められる貨物
        その他これらに類する貨物で政令で定めるものについての輸入港に到着するまでの
        運送に要する運賃及び保険料は、航空機による運送方法以外の通常の運送方法に
        よる運賃及び保険料によるものとする。」
  2項: 「…当該輸入貨物が、本邦に入国する者により携帯して輸入される貨物その他その
        輸入取引が小売取引の段階によるものと認められる貨物で、当該貨物の輸入者の
        個人的な使用に供されると認められるものであるときは、当該輸入貨物の課税価格は、
        当該貨物の輸入が通常の卸取引の段階でされたとした場合の価格とする。
        当該輸入貨物が、本邦に居住する者に寄贈される貨物で、当該寄贈を受ける者の
        個人的な使用に供されると認められるものであるときも、同様とする。」

Computation (Money = Nat):

  airFreightForValuation substitute conventional freight =
    if substitute then conventional else freight
  personalUseValue applies wholesale retail =
    if applies then wholesale else retail

Scope & honest boundaries:

* 1項の「政令で定める額を超えない」「緊急に輸入する必要があると認められる」「政令で定める
  貨物」は法的判断 — caller-established Bool `substituteForConventional`。
* 2項の「個人的な使用に供されると認められる」も法的判断 — caller-established Bool
  `personalUse`（携帯品・小売段階・居住者への寄贈品を含む）。
* 航空運賃・通常運賃・卸価格・小売価格は caller-established Money（政令の算定細目は外）。
* 1項は「運賃及び保険料」の代替であり、課税価格全体の代替ではない。本関数は
  その代替後の運賃等を返す（呼び出し側の art. 4 加算に渡す想定）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 4の6(1) — 政令貨物等なら通常运送方法の運賃等、それ以外は航空実費。 -/
def airFreightForValuation (substituteForConventional : Bool) (conventional freight : Money) : Money :=
  if substituteForConventional then conventional else freight

/-- art. 4の6(2) — 個人的使用品なら卸取引段階の価格、それ以外は小売実費。 -/
def personalUseValue (personalUse : Bool) (wholesale retail : Money) : Money :=
  if personalUse then wholesale else retail

-- ==== verified facts ====

/-- 代替が適用されれば通常运送方法の運賃等が選ばれる。 -/
theorem airFreight_uses_conventional (conventional freight : Money) :
    airFreightForValuation true conventional freight = conventional := rfl

/-- 代替がなければ航空実費が選ばれる。 -/
theorem airFreight_uses_actual (conventional freight : Money) :
    airFreightForValuation false conventional freight = freight := rfl

/-- 個人的使用なら卸価格が選ばれる。 -/
theorem personalUse_uses_wholesale (wholesale retail : Money) :
    personalUseValue true wholesale retail = wholesale := rfl

/-- 個人的使用でなければ小売価格が選ばれる。 -/
theorem personalUse_uses_retail (wholesale retail : Money) :
    personalUseValue false wholesale retail = retail := rfl

-- ==== kernel-decided smoke checks ====

example : airFreightForValuation true 50_000 200_000 = 50_000 := by decide
example : airFreightForValuation false 50_000 200_000 = 200_000 := by decide
example : personalUseValue true 100_000 250_000 = 100_000 := by decide
example : personalUseValue false 100_000 250_000 = 250_000 := by decide
-- 境界: 0円
example : airFreightForValuation true 0 200_000 = 0 := by decide
example : personalUseValue true 0 250_000 = 0 := by decide

end JapanTaxLaw
