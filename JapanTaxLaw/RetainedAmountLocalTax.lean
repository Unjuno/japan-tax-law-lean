import JapanTaxLaw.TaxFinance

/-!
# RetainedAmountLocalTax — 法人税法施行令 art. 139の10（留保金額の計算上控除する道府県民税及び市町村民税の額）L4 モデル

Source (pinned):

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Models the computable core of art. 139の10 — pinned bytes 逐語 (第1項):

  「法人税額から当該法人税額に係る税額控除額を控除した金額に百分の十・四を乗じて計算した金額
    （同条第一項に規定する特定同族会社が当該事業年度において支出した…特定寄附金につき…
      …の規定により道府県民税及び市町村民税（都民税を含む。）の額から控除される金額がある場合には、
      当該特定寄附金の額…の合計額の百分の四十に相当する金額と調整地方税額…
      に百分の二十を乗じて計算した金額とのうちいずれか少ない金額を控除した金額）とする。」

Computation (Money = Nat):

  localTaxBaseRate    = 104/1000  -- 百分の十・四 = 10.4%（1040/1000 = 104% の 10倍過大バグに注意）
  donationFortyRate   = 40/100    -- 百分の四十
  twentyRate          = 20/100    -- 百分の二十

  baseLocalTax adjusted                       = localTaxBaseRate.applyFloor adjusted
  specialDonationAdjustment ds alt             = min (donationFortyRate.applyFloor ds)
                                                    (twentyRate.applyFloor alt)
  retainedAmountLocalTax adjusted alt donationSumOpt =
      match donationSumOpt with
      | none   => baseLocalTax adjusted
      | some ds => baseLocalTax adjusted - specialDonationAdjustment ds alt  -- saturating

Scope & honest boundaries:

* `adjusted`（法人税額 − 当該法人税額に係る税額控除額）は caller-established Money。
  法人税額・税額控除額の算定自体（第2項一号・二号の細目）は本モジュールの射程外。
* `adjustedLocalTax`（調整地方税額）は caller-established Money。第1項括弧内の定義
  （「当該計算した金額 + 第2項二号イ金額×10.4% − 第2項一号イ金額×10.4%」）は
  本モジュールでは算出せず、呼出元が与える。
* 特定寄附金があるか否か（「…控除される金額がある場合」）は caller-established で
  `Option Money` として受け取る。**Bool は金額式に入れない**（存在判定は構造で表現）。
* 特定寄附金の額は「当該事業年度の所得の金額の計算上損金の額に算入されるものに限る」—
  この限定も caller-established（`some` に渡す額は既に限定済みであることを前提とする）。
* 丸めは `TaxRate.applyFloor`（切り捨て）— modeling choice。政令の丸め細目は射程外。
* **Underflow**: 控除額が基本額を超える場合、Nat の saturating subtraction で 0 を返す。
  これは「還付なし」を主張するものではない（還付の処理は本スライスの射程外）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.RetainedAmountLocalTax

open JapanTaxLaw.TaxFinance

/-- art. 139の10(1) — 「百分の十・四」= 104/1000（10.4%）。 -/
def localTaxBaseRate : TaxRate := ⟨104, 1000, by decide⟩

/-- art. 139の10(1)括弧書 — 「百分の四十」= 40/100。 -/
def donationFortyRate : TaxRate := ⟨40, 100, by decide⟩

/-- art. 139の10(1)括弧書 — 「百分の二十」= 20/100。 -/
def twentyRate : TaxRate := ⟨20, 100, by decide⟩

/-- art. 139の10(1) — 基本となる道府県民税及び市町村民税の額
    = (法人税額 − 税額控除額) × 10.4%（切り捨て）。 -/
def baseLocalTax (adjusted : Money) : Money :=
  localTaxBaseRate.applyFloor adjusted

/-- art. 139の10(1)括弧書 — 特定寄附金がある場合に控除する金額
    = min(特定寄附金合計額 × 40%, 調整地方税額 × 20%)（各々切り捨て）。 -/
def specialDonationAdjustment (donationSum adjustedLocalTax : Money) : Money :=
  min (donationFortyRate.applyFloor donationSum)
      (twentyRate.applyFloor adjustedLocalTax)

/-- art. 139の10(1) — 留保金額の計算上控除する道府県民税及び市町村民税の額。
    特定寄附金がない場合は基本額のみ、ある場合は基本額から調整額を控除（saturating）。
    `donationSumOpt` は「控除される金額がある場合」の caller-established な該当性。 -/
def retainedAmountLocalTax (adjusted adjustedLocalTax : Money)
    (donationSumOpt : Option Money) : Money :=
  match donationSumOpt with
  | none => baseLocalTax adjusted
  | some donationSum =>
      baseLocalTax adjusted - specialDonationAdjustment donationSum adjustedLocalTax

-- ==== verified facts (model properties only) ====

theorem localTaxBaseRate_numDen : localTaxBaseRate.numDen = (104, 1000) := rfl
theorem donationFortyRate_numDen : donationFortyRate.numDen = (40, 100) := rfl
theorem twentyRate_numDen : twentyRate.numDen = (20, 100) := rfl

theorem localTaxBaseRate_den_pos : 0 < localTaxBaseRate.den := by decide
theorem donationFortyRate_den_pos : 0 < donationFortyRate.den := by decide
theorem twentyRate_den_pos : 0 < twentyRate.den := by decide

/-- 基本額は adjusted × 104 / 1000 そのもの。 -/
theorem baseLocalTax_eq (adjusted : Money) : baseLocalTax adjusted = adjusted * 104 / 1000 := rfl

/-- 10.4% < 100% なので基本額は adjusted 以下。 -/
theorem baseLocalTax_le (adjusted : Money) : baseLocalTax adjusted ≤ adjusted := by
  unfold baseLocalTax TaxRate.applyFloor localTaxBaseRate
  have hmul : adjusted * 104 ≤ adjusted * 1000 := Nat.mul_le_mul_left adjusted (by decide)
  have hdiv : adjusted * 104 / 1000 ≤ adjusted * 1000 / 1000 := Nat.div_le_div_right hmul
  simpa using hdiv

/-- 基本額は adjusted について単調非減少。 -/
theorem baseLocalTax_mono {a b : Money} (h : a ≤ b) : baseLocalTax a ≤ baseLocalTax b := by
  unfold baseLocalTax TaxRate.applyFloor localTaxBaseRate
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 104 h)

/-- adjusted が 1000 の正整数倍なら基本額は n × 104。 -/
theorem baseLocalTax_mul_thousand (n : Money) : baseLocalTax (n * 1000) = n * 104 := by
  change (n * 1000) * 104 / 1000 = n * 104
  rw [show (n * 1000) * 104 = (n * 104) * 1000 by
    simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]]
  rw [Nat.mul_comm (n * 104) 1000]
  exact Nat.mul_div_right (n * 104) (by decide : 0 < 1000)

/-- adjusted が 1000 の正整数倍なら基本額は正（切り捨てても残る）。 -/
theorem baseLocalTax_pos (n : Money) (h : 0 < n) : 0 < baseLocalTax (n * 1000) := by
  rw [baseLocalTax_mul_thousand]
  exact Nat.mul_pos h (by decide)

/-- 調整額は 40% と 20% の min そのもの。 -/
theorem specialDonationAdjustment_eq (ds alt : Money) :
    specialDonationAdjustment ds alt =
      min (donationFortyRate.applyFloor ds) (twentyRate.applyFloor alt) := rfl

/-- 調整額は特定寄附金の 40% 以下。 -/
theorem specialDonationAdjustment_le_donation (ds alt : Money) :
    specialDonationAdjustment ds alt ≤ donationFortyRate.applyFloor ds := by
  unfold specialDonationAdjustment
  exact Nat.min_le_left _ _

/-- 調整額は調整地方税額の 20% 以下。 -/
theorem specialDonationAdjustment_le_twenty (ds alt : Money) :
    specialDonationAdjustment ds alt ≤ twentyRate.applyFloor alt := by
  unfold specialDonationAdjustment
  exact Nat.min_le_right _ _

/-- 40% 側が小さい（等しい）ときは 40% 側を返す。 -/
theorem specialDonationAdjustment_eq_donation_when (ds alt : Money)
    (h : donationFortyRate.applyFloor ds ≤ twentyRate.applyFloor alt) :
    specialDonationAdjustment ds alt = donationFortyRate.applyFloor ds := by
  unfold specialDonationAdjustment
  exact Nat.min_eq_left h

/-- 20% 側が小さいときは 20% 側を返す。 -/
theorem specialDonationAdjustment_eq_twenty_when (ds alt : Money)
    (h : twentyRate.applyFloor alt ≤ donationFortyRate.applyFloor ds) :
    specialDonationAdjustment ds alt = twentyRate.applyFloor alt := by
  unfold specialDonationAdjustment
  exact Nat.min_eq_right h

/-- 特定寄附金が 0 なら調整額 0（min の 40% 側が 0）。 -/
theorem specialDonationAdjustment_zero_of_donation_zero (alt : Money) :
    specialDonationAdjustment 0 alt = 0 := by
  unfold specialDonationAdjustment
  simp [TaxRate.applyFloor, donationFortyRate]

/-- 寄附金なしの場合は基本額そのもの。 -/
theorem retainedAmountLocalTax_none (adjusted alt : Money) :
    retainedAmountLocalTax adjusted alt none = baseLocalTax adjusted := rfl

/-- 控除後は基本額以下（saturating subtraction）。 -/
theorem retainedAmountLocalTax_le_base (adjusted alt : Money) (ds : Money) :
    retainedAmountLocalTax adjusted alt (some ds) ≤ baseLocalTax adjusted := by
  unfold retainedAmountLocalTax
  exact Nat.sub_le _ _

/-- 調整額が基本額以下のときは通常の減算と一致。 -/
theorem retainedAmountLocalTax_exact (adjusted alt ds : Money)
    (_h : specialDonationAdjustment ds alt ≤ baseLocalTax adjusted) :
    retainedAmountLocalTax adjusted alt (some ds) =
      baseLocalTax adjusted - specialDonationAdjustment ds alt := rfl

/-- 調整額が基本額以上のときは 0（還付は射程外）。 -/
theorem retainedAmountLocalTax_zero_of_over (adjusted alt ds : Money)
    (h : baseLocalTax adjusted ≤ specialDonationAdjustment ds alt) :
    retainedAmountLocalTax adjusted alt (some ds) = 0 := by
  unfold retainedAmountLocalTax
  exact Nat.sub_eq_zero_of_le h

-- ==== kernel-decided smoke checks ====

-- 10.4% = 104/1000（1040/1000 ではない）— 10倍過大バグの検出
example : baseLocalTax 0 = 0 := by decide
example : baseLocalTax 1 = 0 := by decide                 -- 切り捨て
example : baseLocalTax 1000 = 104 := by decide
example : baseLocalTax 100_000 = 10_400 := by decide

-- min の両方: 1000×40%=400, 1000×20%=200 → 200（20%側が小さい）
example : specialDonationAdjustment 1000 1000 = 200 := by decide
-- 1000×40%=400, 10000×20%=2000 → 400（40%側が小さい）
example : specialDonationAdjustment 1000 10_000 = 400 := by decide
-- 境界: 寄附金 0 → 0、調整地方税額 0 → 0
example : specialDonationAdjustment 0 1000 = 0 := by decide
example : specialDonationAdjustment 1000 0 = 0 := by decide
example : specialDonationAdjustment 0 0 = 0 := by decide

-- 寄附金なし
example : retainedAmountLocalTax 1000 1000 none = 104 := by decide
-- 基本 10400 − 調整 200 = 10200
example : retainedAmountLocalTax 100_000 1000 (some 1000) = 10_200 := by decide
-- 基本 10400 − 調整 400 = 10000
example : retainedAmountLocalTax 100_000 10_000 (some 1000) = 10_000 := by decide
-- 控除 > 基本 → saturating で 0
example : retainedAmountLocalTax 1000 1000 (some 1000) = 0 := by decide
example : retainedAmountLocalTax 0 1000 (some 1000) = 0 := by decide

end JapanTaxLaw.RetainedAmountLocalTax
