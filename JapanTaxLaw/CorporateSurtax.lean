import JapanTaxLaw.TaxFinance

/-!
# CorporateSurtax — 法人税法 art. 67（特定同族会社の特別税率） L4 税額計算モデル

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 法人税法 art. 67 — 特定同族会社（specified closely-held corporation）が各事業年度に
留保金額が留保控除額を超える場合、前条等の規定により計算した法人税の額に加算する特別税率
（art. 67(1)）のうち、税額計算の中核部分:

* 第1項本文 — 超える部分の留保金額を三段階に区分して乗算し、加算する:
  - 年三千万円以下の金額 … 百分の十 (art. 67(1) 一号)
  - 年三千万円を超え、年一億円以下の金額 … 百分の十五 (art. 67(1) 二号)
  - 年一億円を超える金額 … 百分の二十 (art. 67(1) 三号)
* 第3項 — 留保金額 = 所得等のうち留保した金額 −（法人税額 + 地方法人税額 +
  道府県民税・市町村民税の額）。本モデルでは、控除の基礎となる三つの税額を呼出元
  入力として受け取り、`retainedAmount` で差引計算する（飽和減算）。
* 第5項 — 留保控除額 = 次の最も多い金額:
  一 所得等の金額の百分の四十に相当する金額
     （第64条の5（損益通算）により損金算入される金額がある場合には加算し、
      益金算入される金額がある場合には減算した後の金額。第64条の5の金額自体は
      呼出元入力。）
  二 年二千万円
  三 利益積立金額（当事業年度分を除く）が資本金・出資金の百分の二十五に満たない
     場合の、満たない部分の金額
* 第6項＋第7項 — 事業年度が1年に満たない場合、「年三千万円」「年一億円」「年二千万円」は
  「〇〇を十二で除し、これに当該事業年度の月数を乗じて計算した金額」に読み替える。
  月数は暦に従い、1月未満の端数は1月とする（art. 67(7)）。本モデルは有効月数を
  正の自然数として受け取る（月数の算定自体は呼出元責任）。

スコープ外（本モデルが導出しないもの — いずれも externally established boolean / 入力
として受け取る、または未モデル化）:

* 第1項括弧書き・第2項 — 被支配会社・特定同族会社の判定（株主等の範囲判定、
  50%超の基準、大通算法人等の除外）は多段的な事実認定を要するため、本モデルでは
  `isSpecifiedCloselyHeld` boolean として呼出元が与える。第8項（事業年度終了の時の
  現況による判定）も同様に呼出元責任。清算中のものを除く、の条件も boolean に内包。
* 第3項の各号（所得等の金額の内訳: 第62条、第23条〜第26条、第57条、第59条、
  第27条等の調整）および第4項（期末配当等による留保金額の調整）は、
  呼出元入力 `incomeAmount` / `retainedBeforeCredits` に織り込み済みであることを前提とする。
* 第3項の「政令で定めるところにより計算した金額」（道府県民税・市町村民税相当）は
  呼出元入力 `inhabitantTaxes`。
* 第9項（政令委任）・第69条19項（外国税額の控除）の計算過程はモデル化しない。
* 端数処理: 各区分の金額に割合を乗じて計算する際、本モデルは区分ごとに切り捨てを
  行った金額を合計する（`TaxRate.applyFloor` と同じ扱い）。 art. 67 自体は加算額の
  端数処理を規定しておらず、申告計算における rounding（国税通則法 art. 118/119、
  本リポジトリの `TaxRounding.lean`）の適用関係は本モデルの射程外。
* `prorated` は第6項の文言どおり「十二で除し、これに月数を乗じて」の順で計算する。
  年一億円および年二千万円は 12 で割り切れないため、切り捨ての影響が残る
  （例: 12 か月ちょうどの場合は第6項が適用されないので年額そのものが適用されるが、
   11 か月では floor(100,000,000/12)×11 = 91,666,663 となる）。これは文言の直読による
  **modeling candidate** であり、乗算先行（base × months / 12）との差は 法令の文理解釈
  として別途の検討が要る（本モデルは文言直読を採用した、という記録である）。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 特定同族会社の特別税率の計算に必要な事実一式。各フィールドは呼出元が供給する。 -/
structure CloselyHeldFacts where
  /-- 特定同族会社に該当するか（art. 67(1) 括弧書き・(2)・(8)）— externally established。
      清算中のものを除く条件もここに内包される。 -/
  isSpecifiedCloselyHeld : Bool
  /-- 所得等の金額（art. 67(3) 一〜七号合計 − 七号（益金算入の還付金等））。
      第62条、第23〜26条、第57条、第59条、第27条の調整を織り込み済みであること。 -/
  incomeAmount : Money
  /-- 第64条の5(1) により損金の額に算入された金額（art. 67(5) 一号で加算）。 -/
  lossOffset : Money
  /-- 第64条の5(3) により益金の額に算入された金額（art. 67(5) 一号で減算）。 -/
  profitAddback : Money
  /-- 所得等のうち留保した金額（art. 67(3) 本文。art. 67(4) の期末配当等による
      調整を織り込み済みであること）。 -/
  retainedBeforeCredits : Money
  /-- 前条等の規定により計算した法人税の額（art. 67(1)「これらの規定により計算した
      法人税の額」の基礎。art. 69(19) 外国税額の控除後が望ましいが、その計算自体は
      呼出元責任）。art. 67(3) の控除にも同額を用いる。 -/
  baseCorporateTax : Money
  /-- 当事業年度の地方法人税額（地方法人税法9条2項・6条1項一号の基準法人税額に係るもの。
      art. 67(3) の控除）。 -/
  localCorporateTax : Money
  /-- 当該法人税の額に係る道府県民税及び市町村民税（都民税を含む）の額として
      政令で定めるところにより計算した金額（art. 67(3) の控除）。 -/
  inhabitantTaxes : Money
  /-- 当該事業年度終了の時における利益積立金額（当該事業年度の所得等の金額に係る
      部分の金額を除く。art. 67(5) 三号）。 -/
  retainedEarningsExCurrent : Money
  /-- 当該事業年度終了の時における資本金の額又は出資金の額（art. 67(5) 三号）。 -/
  capital : Money
  /-- 当該事業年度の月数（art. 67(6)(7)）。暦に従い、1月未満の端数は1月。
      12 以上の場合は年額がそのまま適用される（art. 67(6) は 1年に満たない
      事業年度にのみ適用されるため）。 -/
  months : Nat
  deriving DecidableEq, Repr

/-- 第6項: 「十二で除し、これに当該事業年度の月数を乗じて計算した金額」
    （事業年度が1年に満たない場合にのみ適用される読替え）。
    `12 ≤ months` の場合は年額そのもの。 -/
def prorated (base : Money) (months : Nat) : Money :=
  if 12 ≤ months then base else base / 12 * months

/-- 第6項読替え後の第1項一号の区分線（年三千万円）。 -/
def tier1Cap (months : Nat) : Money := prorated 30_000_000 months

/-- 第6項読替え後の第1項二号・三号の区分線（年一億円）。 -/
def tier2Cap (months : Nat) : Money := prorated 100_000_000 months

/-- 第5項二号: 年二千万円（第6項により月割読替えあり）。 -/
def retentionMinDeduction (months : Nat) : Money := prorated 20_000_000 months

/-- 第5項一号の計算基礎: 所得等の金額 + 第64条の5(1) 損金算入額 − 第64条の5(3) 益金算入額。
    減算は飽和減算（負にはならない）。 -/
def incomeFortyBase (f : CloselyHeldFacts) : Money :=
  f.incomeAmount + f.lossOffset - f.profitAddback

/-- 第5項一号: 所得等の金額（第64条の5調整後）の百分の四十に相当する金額（切り捨て）。 -/
def incomeFortyPct (f : CloselyHeldFacts) : Money := incomeFortyBase f * 40 / 100

/-- 第5項三号: 利益積立金額が資本金・出資金の百分の二十五に満たない場合の、
    満たない部分の金額。満たない場合でなければ 0。 -/
def capitalShortfall (f : CloselyHeldFacts) : Money :=
  if f.retainedEarningsExCurrent < f.capital * 25 / 100
  then f.capital * 25 / 100 - f.retainedEarningsExCurrent
  else 0

/-- 第5項本文: 留保控除額 = 上記一〜三のうち最も多い金額。 -/
def retentionDeduction (f : CloselyHeldFacts) : Money :=
  max (max (incomeFortyPct f) (retentionMinDeduction f.months)) (capitalShortfall f)

/-- 第3項本文: 留保金額 = 留保した金額 −（法人税額 + 地方法人税額 + 道府県民税・
    市町村民税の額の合計額）。飽和減算。 -/
def retainedAmount (f : CloselyHeldFacts) : Money :=
  f.retainedBeforeCredits - (f.baseCorporateTax + f.localCorporateTax + f.inhabitantTaxes)

/-- 第1項本文の「超える部分の留保金額」。留保控除額を超えない場合は 0
    （その場合、特別税率は課されない）。 -/
def excessRetained (f : CloselyHeldFacts) : Money := retainedAmount f - retentionDeduction f

/-- 第1項一〜三号の区分に従った加算額（本来の税額への加算分）。
    特殊同族会社に該当しない場合は 0。各区分ごとに切り捨ててから合計する。 -/
def specialSurtax (f : CloselyHeldFacts) : Money :=
  if f.isSpecifiedCloselyHeld then
    let t1 := tier1Cap f.months
    let t2 := tier2Cap f.months
    let excess := excessRetained f
    let band1 := min excess t1
    let rem1 := excess - band1
    let band2 := min rem1 (t2 - t1)
    let band3 := rem1 - band2
    (band1 * 10) / 100 + (band2 * 15) / 100 + (band3 * 20) / 100
  else 0

/-- art. 67(1) 本文: 前条等の規定により計算した法人税の額に特別税率の加算額を
    加算した金額（art. 67(1)「これらの規定により計算した法人税の額に、…加算した金額
    とする」）。 -/
def totalTaxWithSurtax (f : CloselyHeldFacts) : Money := f.baseCorporateTax + specialSurtax f

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- art. 67(6) は 1年に満たない事業年度にのみ適用される: 12 か月以上なら年額そのまま。 -/
theorem prorated_of_full_year (base : Money) (months : Nat) (h : 12 ≤ months) :
    prorated base months = base := by
  unfold prorated
  simp [h]

/-- 区分線は月に単調に読み替えられ、短期事業年度の第1区分線は第2区分線以下。 -/
theorem tier1_le_tier2 (months : Nat) : tier1Cap months ≤ tier2Cap months := by
  unfold tier1Cap tier2Cap prorated
  by_cases h : 12 ≤ months
  · simp [h]
  · simp only [h, ite_false]
    rw [show 30_000_000 / 12 = 2_500_000 from by decide,
        show 100_000_000 / 12 = 8_333_333 from by decide]
    exact Nat.mul_le_mul_right months (by decide)

/-- 3つの区分の金額の合計は、超える部分の留保金額に等しい（過不足なく区分される）。 -/
theorem bands_sum (excess t1 t2 : Money) (h : t1 ≤ t2) :
    min excess t1 + min (excess - min excess t1) (t2 - t1)
      + (excess - min excess t1 - min (excess - min excess t1) (t2 - t1)) = excess := by
  rcases Nat.lt_or_ge excess t1 with h1 | h1
  · rw [Nat.min_eq_left (Nat.le_of_lt h1)]
    simp
  · have h1' : t1 ≤ excess := h1
    rw [Nat.min_eq_right h1']
    rcases Nat.lt_or_ge (excess - t1) (t2 - t1) with h2 | h2
    · have h2' : excess - t1 ≤ t2 - t1 := Nat.le_of_lt h2
      rw [Nat.min_eq_left h2', Nat.sub_self, Nat.add_zero]
      exact Nat.add_sub_cancel' h1'
    · have h2' : t2 - t1 ≤ excess - t1 := h2
      have h2'' : t2 ≤ excess := by
        calc t2 = t1 + (t2 - t1) := (Nat.add_sub_cancel' h).symm
          _ ≤ t1 + (excess - t1) := Nat.add_le_add_left h2' t1
          _ = excess := Nat.add_sub_cancel' h1'
      rw [Nat.min_eq_right h2', Nat.sub_sub, Nat.add_sub_cancel' h]
      exact Nat.add_sub_cancel' h2''

/-- 留保控除額は所得等の金額の百分の四十を下回らない。 -/
theorem income_forty_le_deduction (f : CloselyHeldFacts) :
    incomeFortyPct f ≤ retentionDeduction f := by
  unfold retentionDeduction
  have h1 : incomeFortyPct f ≤ max (incomeFortyPct f) (retentionMinDeduction f.months) :=
    Nat.le_max_left _ _
  exact Nat.le_trans h1 (Nat.le_max_left _ _)

/-- 留保控除額は年二千万円相当額（月割読替え後）を下回らない。 -/
theorem min_deduction_le_deduction (f : CloselyHeldFacts) :
    retentionMinDeduction f.months ≤ retentionDeduction f := by
  unfold retentionDeduction
  have h1 : retentionMinDeduction f.months ≤
      max (incomeFortyPct f) (retentionMinDeduction f.months) := Nat.le_max_right _ _
  exact Nat.le_trans h1 (Nat.le_max_left _ _)

/-- 留保控除額は資本金不足額を下回らない。 -/
theorem capital_shortfall_le_deduction (f : CloselyHeldFacts) :
    capitalShortfall f ≤ retentionDeduction f := Nat.le_max_right _ _

/-- 利益積立金額が閾値以上なら、資本金不足額は 0。 -/
theorem capitalShortfall_eq_zero (f : CloselyHeldFacts)
    (h : f.capital * 25 / 100 ≤ f.retainedEarningsExCurrent) :
    capitalShortfall f = 0 := by
  unfold capitalShortfall
  have hnot : ¬ f.retainedEarningsExCurrent < f.capital * 25 / 100 := Nat.not_lt.mpr h
  rw [ite_eq_right hnot]

/-- 留保金額が留保控除額を超えなければ、超える部分は 0（第1項本文の「超える場合には」）。 -/
theorem excess_eq_zero_of_not_exceeding (f : CloselyHeldFacts)
    (h : retainedAmount f ≤ retentionDeduction f) : excessRetained f = 0 := by
  unfold excessRetained
  exact Nat.sub_eq_zero_of_le h

/-- 留保金額が留保控除額を超えなければ、特別税率の加算額は 0。 -/
theorem surtax_eq_zero_of_not_exceeding (f : CloselyHeldFacts)
    (h : retainedAmount f ≤ retentionDeduction f) : specialSurtax f = 0 := by
  unfold specialSurtax
  rw [excess_eq_zero_of_not_exceeding f h]
  split <;> simp

/-- 特定同族会社に該当しなければ、特別税率の加算額は 0。 -/
theorem surtax_eq_zero_of_not_qualifying (f : CloselyHeldFacts)
    (h : f.isSpecifiedCloselyHeld = false) : specialSurtax f = 0 := by
  unfold specialSurtax
  simp [h]

/-- 加算後の金額は、基礎となる法人税の額以上。 -/
theorem surtax_nonneg (f : CloselyHeldFacts) :
    f.baseCorporateTax ≤ totalTaxWithSurtax f := by
  unfold totalTaxWithSurtax
  exact Nat.le_add_right _ _

/-- 第5項三号の閾値（資本金の百分の二十五）は百分の二十五として計算される。 -/
theorem capital_threshold_25pct (f : CloselyHeldFacts) :
    capitalShortfall f = 0 ∨
      capitalShortfall f = f.capital * 25 / 100 - f.retainedEarningsExCurrent := by
  unfold capitalShortfall
  by_cases h : f.retainedEarningsExCurrent < f.capital * 25 / 100
  · rw [ite_eq_left h]
    exact Or.inr rfl
  · rw [ite_eq_right h]
    exact Or.inl rfl

end JapanTaxLaw
