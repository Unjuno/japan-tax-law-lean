import JapanTaxLaw.TaxFinance

/-!
# ListedDividendWithholding — 租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例）L4 computation slice

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as SpecialGiftRate.lean / DeemedCapitalGainsCost.lean / ResidentialTransferSpecialTax.lean)

Models art. 9の3の二(1)（税率）と art. 9の3の二(3)（控除の限度）— pinned bytes 逐語:

  「…当該上場株式等の配当等の支払の取扱者…は、当該個人又は内国法人若しくは外国法人に当該上場株式等
    の配当等の交付をする際、その交付をする金額（第三項の規定により控除する同項各号に定める金額がある
    場合には、当該金額その他の政令で定める金額を加算した金額）に百分の十五（第一号に掲げる配当等で
    その配当等の支払をする内国法人に係る大口株主等に対し交付をするものについては、百分の二十）の
    税率を乗じて計算した金額の所得税を徴収し、その徴収の日の属する月の翌月十日までに、これを国に納付しなければならない。」

  「第三項…支払の取扱者が交付をする上場株式等の配当等の次の各号に掲げる区分に応じ当該各号に定める
    金額があるときは、当該各号に定める金額は、同項の規定により徴収して納付すべき当該上場株式等の
    配当等に係る所得税の額を限度として当該所得税の額から控除する。」

Computation:

  rate = `listedDividendRate isLargeShareholderDividend` (15% / 20%)
  withholdingBase = 交付をする金額 + 控除対象外国法人税等（＝第一項の文言により加算）
  withholdingGross = floor(withholdingBase * rate)     -- 第一項・切り捨て
  withholdingDeduction = min foreignSpecificTax withholdingGross  -- 第三項：徴収すべき所得税の額を限度とする
  withholdingNet = withholdingGross - withholdingDeduction

Out of scope / not modelled:

* art. 9の3の二(1) 第一号〜六号（のカテゴリの定義と政令で定める基準日の管理）
  — caller-established booleans; this model takes `isLargeShareholderDividend : Bool`
  as externally established; the categorisation itself is not modelled.
* art. 9の3の二(3) 各号の具体的計算（証券投資信託等・特定目的会社・投資法人・特定目的信託の各外国法人税額の按分計算）
  — externally established `foreignSpecificTax : Money`; the 按分（政令の規定）はモデル化しない。
* art. 9の3の二(4)（源泉徴収に係る所得税とみなして、所得税法・国税通則法・国税徴収法の規定を適用する）
  — 非モデル化。
* art. 9の3の二(5)〜(7)（所得税法の読み替え・復興特別所得税の関係・地方税の特例）— 非モデル化。
* art. 9の3（源泉徴収税率等の特例・上場株式等の配当等への百分の十五の読替えそのもの）— 本モデルでは扱わない（別エントリの射程）。

Eligibility-false side: if `isLargeShareholderDividend = true`, the rate is 20%;
otherwise 15%. No cat-excluded fallback: the art. 9の3の二 is itself the special regime
for those payments; non-"上場株式等の配当等" payments do not enter this model at all.

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 9の3の二(1) の適用条件を externally established booleans / 金額で表す。 -/
structure ListedDividendFacts where
  /-- 第一号に掲げる配当等でその配当等の支払をする内国法人に係る大口株主等に対し交付をするか（caller-established）。 -/
  isLargeShareholderDividend : Bool
  /-- 第一項: 交付をする金額。 -/
  exchangeAmount : Money
  /-- 第三項の規定により控除する同項各号に定める金額（外国法人税・内国法人所得税の額の按分金額。
      caller-established; 政令の按分計算はモデル化しない）。第一項の加算額でもある。 -/
  foreignSpecificTax : Money
  deriving DecidableEq, Repr

/-- art. 9の3の二(1): isLargeShareholderDividend なら百分の二十、そうでなければ百分の十五。 -/
def listedDividendRate (isLargeShareholderDividend : Bool) : TaxRate :=
  if isLargeShareholderDividend then ⟨20, 100, by decide⟩ else ⟨15, 100, by decide⟩

/-- 第一項: 交付をする金額に、控除対応外国税等があれば加算した金額。 -/
def withholdingBase (f : ListedDividendFacts) : Money :=
  f.exchangeAmount + f.foreignSpecificTax

/-- 第一項: 税率を乗じて計算した金額（切り捨て）。 -/
def withholdingGross (f : ListedDividendFacts) : Money :=
  (listedDividendRate f.isLargeShareholderDividend).applyFloor (withholdingBase f)

/-- 第三項: 控除額はその所得税の額を限度として当該所得税の額から控除する。 -/
def withholdingDeduction (f : ListedDividendFacts) : Money :=
  min f.foreignSpecificTax (withholdingGross f)

/-- 第一項 + 第三項: 実際に徴収して納付すべき所得税の額。 -/
def withholdingNet (f : ListedDividendFacts) : Money :=
  withholdingGross f - withholdingDeduction f

-- ==== verified model facts ====

/-- 控除は第三項の文言どおり、その所得税の額を限度とする。 -/
theorem withholdingDeduction_le_gross (f : ListedDividendFacts) :
    withholdingDeduction f ≤ withholdingGross f := Nat.min_le_right _ _

theorem withholdingDeduction_le_foreignSpecificTax (f : ListedDividendFacts) :
    withholdingDeduction f ≤ f.foreignSpecificTax := Nat.min_le_left _ _

/-- 加算後の金額は交付金額を下回らない（加算金額は非負）。 -/
theorem withholdingBase_ge_exchange (f : ListedDividendFacts) :
    f.exchangeAmount ≤ withholdingBase f := Nat.le_add_right _ _

/-- 控除後の額は元税額を超えない。 -/
theorem withholdingNet_le_gross (f : ListedDividendFacts) :
    withholdingNet f ≤ withholdingGross f := Nat.sub_le _ _

/-- 純額は常に 0 以上（サブトラクションはモジュラではない）。 -/
theorem withholdingNet_nonneg (f : ListedDividendFacts) : 0 ≤ withholdingNet f := Nat.zero_le _

/-- 外国税等が無ければ、控除も無く、徴収すべき額は元税額と等しい。 -/
theorem withholdingNet_eq_gross_of_no_foreign (f : ListedDividendFacts)
    (h : f.foreignSpecificTax = 0) : withholdingNet f = withholdingGross f := by
  unfold withholdingNet withholdingDeduction
  rw [h]
  simp

/-- 大口株主の税率は 20%、それ以外は 15% と言い換えられる。 -/
theorem listedDividendRate_large :
    listedDividendRate true = ⟨20, 100, by decide⟩ := rfl
theorem listedDividendRate_regular :
    listedDividendRate false = ⟨15, 100, by decide⟩ := rfl

/-- 大口株主のとき、元税額は同一 base においてそれ以外の 4/3 倍以上ではないが、大きくなる。 -/
theorem withholdingGross_large_ge_regular (f : ListedDividendFacts) :
    withholdingGross ⟨false, f.exchangeAmount, f.foreignSpecificTax⟩ ≤
      withholdingGross ⟨true, f.exchangeAmount, f.foreignSpecificTax⟩ := by
  unfold withholdingGross listedDividendRate withholdingBase
  exact Nat.div_le_div_right (Nat.mul_le_mul_left _ (by decide : 15 ≤ 20))

-- ==== kernel-decided smoke checks ====

-- basic: base=100,000, no foreign → 15% = 15,000
example : withholdingNet ⟨false, 100_000, 0⟩ = 15_000 := by decide
-- large shareholder: 20% = 20,000
example : withholdingNet ⟨true, 100_000, 0⟩ = 20_000 := by decide
-- foreign tax smaller than tax: exchange 1,000,000, foreign 50,000
-- base 1,050,000, 15% = 157,500; deduction min(50,000, 157,500) = 50,000 → net 107,500
example : withholdingNet ⟨false, 1_000_000, 50_000⟩ = 107_500 := by decide
-- foreign tax bigger than tax: exchange 100_000, foreign 50_000
-- base 150_000, 15% = 22_500; deduction min(50,000, 22,500) = 22,500 → net 0
example : withholdingNet ⟨false, 100_000, 50_000⟩ = 0 := by decide
-- large + foreign
example : withholdingNet ⟨true, 1_000_000, 100_000⟩ = 120_000 := by decide
example : withholdingNet ⟨true, 10_000_000, 100_000⟩ = 1_920_000 := by decide
example : withholdingNet ⟨true, 1_000_000, 900_000⟩ = 0 := by decide

end JapanTaxLaw
