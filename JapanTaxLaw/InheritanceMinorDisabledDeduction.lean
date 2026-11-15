import JapanTaxLaw.TaxFinance

/-!
# InheritanceMinorDisabledDeduction — 相続税法 未成年者控除・障害者控除 (L4)

Sources (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Scope:

* **Art. 19-3 未成年者控除** (相続税法) — 被相続人の前条第一項に規定する相続人（相続人の放棄が
  あった場合には、その放棄がなかったものとした場合における相続人）に該当し、かつ、
  **十八歳未満の者**である場合においては、第十五条から前条までの規定により算出した金額から
  **十万円にその者が十八歳に達するまでの年数（当該年数が一年未満であるとき、又はこれに一年未満の
  端数があるときは、これを一年とする。）**を乗じて算出した金額を控除
  * ただし書き： 当該年数の端数処理は控除の全額について政令で別途定める。本モデルでは
    「月数→切上げ」で表現する。
  * art. 19-3(2): 超過部分（算出税額を超える場合）は扶養義務者の相続税額から控除
    （超過部分の金額を `minorExcess` として露出）
  * art. 19-3(3): 既控除を受けたことがある場合の上限調整は**非モデル化**
    （外部で調整を反映した額のみを入力として受け取る）.
* **Art. 19-4 障害者控除** — 政令で定める障害者に該当する相続人に対し、
  第十五条から前条までの規定により算出した金額から**十万円**（その者が
  **特別障害者**である場合には、**二十万円**）にその者が**八十五歳に達するまでの年数**
  （当該年数が一年未満であるとき、又はこれに一年未満の端数があるときは、これを一年とする。）
  を乗じて算出した金額を控除
  * art. 19-4(2) の定義（障害者とは…の意義）はモデル化しない — caller が文言に照らして判断する。
  * art. 19-4(3): arts. 19-3(2)/(3) 準用（読替えに係る部分を含む）→ 本モデルでは同じ構造の
    `disabledExcess` を露出するだけで控除計算には組み込まない。
* 適用要件（該当者が第一条の三第一項第三号又は第四号（相続人たる地位に関する消滅の要件）に該当する者の
  除外、相続人に該当すること、18歳未満であること／政令の障害者定義を満たすこと）は、
  caller-established externally-established booleans で表現する（他モデルと同じ構図）。

Out of scope:

* art. 19-3(2) の「政令で定めるところにより、その控除を受ける者の扶養義務者が…相続又は遺贈により
  取得した財産の価額について第十五条から前条までの規定により算出した金額から控除し、その控除後の金額をもって、
  当該扶養義務者の納付すべき相続税額とする」の詳細実装（モデルの外： 扶養義務者の算出税額・控除の順序適用）
  — 超過部分の算定式のみをここに置く。
* art. 19-3(3) / art. 19-4(3)（既控除上限・準用）の実装 — 外部入力として扱う。
* 障害者/特別障害者の政令定義（施行令 4の3等）の展開 — 文言参照のみ。
* 相続税の総额算定（art. 15–18）は InheritanceTax.lean の射程。本モデルは控除額のみを返す。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 相続税法 art. 19-3/19-4 柱書の月数→年数切上げ（「当該年数が一年未満であるとき、
    又はこれに一年未満の端数があるときは、これを一年とする」）。 -/
def yearsCeil (months : Nat) : Nat := (months + 11) / 12

/-- 相続税法 art. 19-3(1)/19-4(1) 柱書の年数切上げは単調非減少。 -/
theorem yearsCeil_mono {m₁ m₂ : Nat} (h : m₁ ≤ m₂) : yearsCeil m₁ ≤ yearsCeil m₂ := by
  unfold yearsCeil
  exact Nat.div_le_div_right (Nat.add_le_add_right h 11)

theorem yearsCeil_11 : yearsCeil 11 = 1 := by decide
theorem yearsCeil_12 : yearsCeil 12 = 1 := by decide
theorem yearsCeil_13 : yearsCeil 13 = 2 := by decide
theorem yearsCeil_180 : yearsCeil 180 = 15 := by decide
theorem yearsCeil_0 : yearsCeil 0 = 0 := by decide

/-- 相続税法 art. 19-3 柱書の適用要件（externally established booleans）。 -/
structure MinorDeductionFacts where
  /-- art. 19-3 柱書： その者が相続人（相続放棄なし扱いの相続人）に該当し、かつ、
      十八歳未満の者かどうか。第一条の三第一項第三号又は第四号に該当する者は除く（除外規定は
      柱書に内包されるので常にここに含める）。 -/
  isMinorHeir : Bool
  /-- 相続開始時点でその者が十八歳に達するまでの月数（端数は年数の段階で切上げ処理）。 -/
  monthsTo18Ceil : Nat
  deriving DecidableEq, Repr

/-- 相続税法 art. 19-4 柱書の適用要件（externally established booleans）。 -/
structure DisabledDeductionFacts where
  /-- art. 19-4 柱書： 相続人であり、かつ政令で定める障害者に該当するかどうか。
      第一条の三第一項第二号から第四号までに該当する者は除く（柱書に内包）。 -/
  isDisabledHeir : Bool
  /-- 特別障害者か（政令で定める重度の障害者）。 -/
  isSpecialDisabled : Bool
  /-- 相続開始時点でその者が八十五歳に達するまでの月数。 -/
  monthsTo85Ceil : Nat
  deriving DecidableEq, Repr

/-- 相続税法 art. 19-3 の控除額。 -/
def minorDeduction (f : MinorDeductionFacts) : Money :=
  if f.isMinorHeir then yearsCeil f.monthsTo18Ceil * 100_000 else 0

/-- 相続税法 art. 19-4 の控除額。 -/
def disabledDeduction (f : DisabledDeductionFacts) : Money :=
  if f.isDisabledHeir then
    yearsCeil f.monthsTo85Ceil * (if f.isSpecialDisabled then 200_000 else 100_000)
  else 0

/-- 相続税法 art. 19-3(2)/19-4(3): 控除を受ける者について算出した金額より控除額が
    大きい場合の超える部分（その超過部分は扶養義務者の相続税額から控除される金額）。 -/
def minorExcess (f : MinorDeductionFacts) (computedTax : Money) : Money :=
  let d := minorDeduction f
  if computedTax ≤ d then d - computedTax else 0

def disabledExcess (f : DisabledDeductionFacts) (computedTax : Money) : Money :=
  let d := disabledDeduction f
  if computedTax ≤ d then d - computedTax else 0

-- ==== verified model facts ====

theorem minorDeduction_zero_of_not_heir (f : MinorDeductionFacts) (h : f.isMinorHeir = false) :
    minorDeduction f = 0 := by unfold minorDeduction; simp [h]

theorem disabledDeduction_zero_of_not_heir (f : DisabledDeductionFacts)
    (h : f.isDisabledHeir = false) : disabledDeduction f = 0 := by unfold disabledDeduction; simp [h]

theorem minorDeduction_nonneg (f : MinorDeductionFacts) : 0 ≤ minorDeduction f := Nat.zero_le _

theorem disabledDeduction_special_ge (f : DisabledDeductionFacts) (h : f.isSpecialDisabled = true)
    (h' : f.isDisabledHeir = true) :
    disabledDeduction f ≥ yearsCeil f.monthsTo85Ceil * 100_000 := by
  unfold disabledDeduction
  rw [h', h]
  exact Nat.mul_le_mul_left _ (by decide : (100_000 : Money) ≤ 200_000)

/-- 上限側の健全性: 控除額は歳-naíve 上限 (18 or 85) × 基本額を超えない。 -/
theorem minorDeduction_le_180 (f : MinorDeductionFacts) (h : f.monthsTo18Ceil ≤ 216) :
    minorDeduction f ≤ 1_800_000 := by
  unfold minorDeduction
  by_cases h' : f.isMinorHeir = true
  · rw [h']
    have hle : yearsCeil f.monthsTo18Ceil ≤ yearsCeil 216 := yearsCeil_mono h
    have h18 : yearsCeil 216 = 18 := by decide
    rw [h18] at hle
    calc yearsCeil f.monthsTo18Ceil * 100_000
        ≤ 18 * 100_000 := Nat.mul_le_mul_right 100_000 hle
      _ = 1_800_000 := by decide
  · rw [ite_eq_right h']
    exact Nat.zero_le _

example : minorDeduction ⟨true, 30⟩ = 300_000 := by decide
example : minorDeduction ⟨true, 180⟩ = 1_500_000 := by decide
example : minorDeduction ⟨true, 1⟩ = 100_000 := by decide
example : minorDeduction ⟨true, 12⟩ = 100_000 := by decide
example : minorDeduction ⟨true, 13⟩ = 200_000 := by decide
example : minorDeduction ⟨false, 60⟩ = 0 := by decide
example : minorDeduction ⟨true, 0⟩ = 0 := by decide

example : disabledDeduction ⟨true, false, 180⟩ = 1_500_000 := by decide
example : disabledDeduction ⟨true, true, 180⟩ = 3_000_000 := by decide
example : disabledDeduction ⟨true, false, 1020⟩ = 8_500_000 := by decide
example : disabledDeduction ⟨true, true, 1020⟩ = 17_000_000 := by decide
example : disabledDeduction ⟨true, false, 1⟩ = 100_000 := by decide
example : disabledDeduction ⟨true, false, 12⟩ = 100_000 := by decide
example : disabledDeduction ⟨true, false, 13⟩ = 200_000 := by decide
example : disabledDeduction ⟨false, true, 100⟩ = 0 := by decide
example : disabledDeduction ⟨true, true, 0⟩ = 0 := by decide

example : minorExcess ⟨true, 60⟩ 100_000 = 400_000 := by decide
example : minorExcess ⟨true, 60⟩ 600_000 = 0 := by decide
example : minorExcess ⟨true, 60⟩ 0 = 500_000 := by decide
example : disabledExcess ⟨true, true, 60⟩ 100_000 = 900_000 := by decide
example : disabledExcess ⟨true, true, 60⟩ 1_000_000 = 0 := by decide

end JapanTaxLaw
