import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxRate — 相続税法 art. 15/16 progressive tax computation (L4)

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Scope:

* **Art. 16（相続税の総額）** — the progressive rate table:
  ¥10,000,000以下 → 10%; ¥30,000,000以下 → 15%; ¥50,000,000以下 → 20%;
  ¥100,000,000以下 → 30%; ¥200,000,000以下 → 40%; ¥300,000,000以下 → 45%;
  ¥600,000,000以下 → 50%; anything above → 55%.
  The statutory computation splits the taxable remainder by each
  法定相続分's portion and sums the per-portion taxes; this module computes
  the per-portion tax directly (`inheritedPortionTax`).

* **Art. 15（遺産に係る基礎控除）** — "三千万円と六百万円に当該被相続人の
  相続人の数を乗じて算出した金額との合計額" (¥30,000,000 + ¥6,000,000 ×
  相続人の数）. The 相続人の数 counts for the special adoption rules of
  art. 15(2): a person with natural children counts at most one adopted child
  (and one if 0 natural children but ≥1 adopted), otherwise at most two —
  see `limitedAdoptedHeirs`.

* **Art. 17（各相続人等の相続税額）** — total inherits a share proportional
  to each heir's 課税価格； modeled here only for the
  spouse + children scenario (가장 흔한 ケース), since
  法定相続分 for other heir kinds (直系尊属・兄弟姉妹) is out of scope here.

Scope notes / honest limits:
- The tax owed by each heir — art. 17 — splitting the art. 16 総額 by each
  heir's share ratio. The "spouse + children" case only: spouse takes 50%,
  children split the other 50% equally.
- 相続税の課税価格 computation (art. 11–14): out of scope.
- 相次相続控除 art. 20, 教育資金一括贈与 etc.: out of scope.
- The exact statutory algorithm splits the remainder evenly by
  法定相続分 — i.e. each heir is deemed to acquire that fraction. Shares are
  computed here with exact integer division; rounding is a candidate.

Interface:
  `inheritedPortionTax x`         — per-portion art. 16 rate computation
  `inheritanceBasicDeduction n`   — art. 15 deduction (¥3,000万 + ¥600万 × heirs)
  `limitedAdoptedHeirs natural adopted` — art. 15(2) adoption-count limit
  `spouseAndChildrenTotalTax total heirs children` — the full spouse+ children
                                                   art. 15-16 composite

Determinism: closed over `Nat` arithmetic — total, terminating, `decide`-able.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- The eight brackets of the art. 16 table, as (inclusive upper edge, rate). -/
structure InheritanceRateBand where
  limit : Money
  pct : Nat
  deriving DecidableEq, Repr

/-- Art. 16 bracket table (inclusive upper edges, in yen). -/
def inheritanceRateTable : List InheritanceRateBand :=
  [ { limit := 10_000_000, pct := 10 },
    { limit := 30_000_000, pct := 15 },
    { limit := 50_000_000, pct := 20 },
    { limit := 100_000_000, pct := 30 },
    { limit := 200_000_000, pct := 40 },
    { limit := 300_000_000, pct := 45 },
    { limit := 600_000_000, pct := 50 }
    -- everything above is 55%
    ]

/-- Top rate for the open band. -/
def inheritanceTopRate : TaxRate := ⟨55, 100, by decide⟩

/-- Art. 16 per-portion tax, directly from the table with per-product floor. -/
def inheritedPortionTax (x : Money) : Money :=
  let rec go (lo : Money) : List InheritanceRateBand → Money
    | [] => inheritanceTopRate.applyFloor (x - lo)
    | b :: rest =>
        (⟨b.pct, 100, by decide⟩ : TaxRate).applyFloor
          (Nat.min x b.limit - Nat.min x lo) + go b.limit rest
  go 0 inheritanceRateTable

/-- 遺産に係る基礎控除 (art. 15(1)): ¥30,000,000 + ¥6,000,000 × heirs. -/
def inheritanceBasicDeduction (heirs : Nat) : Money :=
  30_000_000 + 6_000_000 * heirs

/-- Art. 15(2) adoption-count limit on 相続人の数.
    - natural children ≥ 1 → adopted children count at most 1 toward the total;
    - natural children = 0 → adopted children count at most 2 toward the total.
    (Special-adoption children count as natural children; callers pass them
    already included in `naturalChildren`.) -/
def limitedAdoptedHeirs (naturalChildren : Nat) (adoptedChildren : Nat) : Nat :=
  if naturalChildren ≥ 1 then
    naturalChildren + Nat.min adoptedChildren 1
  else
    Nat.min adoptedChildren 2

/-- Art. 16 composite for the spouse+children case (most common profile):
    - spouse receives 50% of the after-deduction remainder; each child an equal
      share of the other 50%; each portion independently taxed by art. 16;
      the totals summed.
    Not the complete 法定相続分 table — only 配偶者＋子.
    `yearsHeirCount` — 相続人の数 (as limited by art. 15(2)). -/
def spouseAndChildrenTotalTax (total : Money) (heirCount : Nat) (children : Nat) : Money :=
  let net := total - inheritanceBasicDeduction heirCount
  let half := net / 2
  if children = 0 then
    inheritedPortionTax net
  else
    inheritedPortionTax half +
      ((List.replicate children (half / children)).map inheritedPortionTax).sum

-- ==== verified facts ====

/-- The basic deduction increases by exactly ¥6,000,000 per heir. -/
theorem inheritanceBasicDeduction_succ (n : Nat) :
    inheritanceBasicDeduction (n + 1) = inheritanceBasicDeduction n + 6_000_000 := by
  unfold inheritanceBasicDeduction
  simp [Nat.mul_add, Nat.add_assoc, Nat.add_comm]

/-- The basic deduction is non-decreasing in the number of heirs. -/
theorem inheritanceBasicDeduction_mono {m n : Nat} (h : m ≤ n) :
    inheritanceBasicDeduction m ≤ inheritanceBasicDeduction n := by
  unfold inheritanceBasicDeduction
  exact Nat.add_le_add_left (Nat.mul_le_mul_left 6_000_000 h) 30_000_000

/-- The adoption-limit never expands the counted heirs beyond natural + 2. -/
theorem limitedAdoptedHeirs_le (naturalChildren adoptedChildren : Nat) :
    limitedAdoptedHeirs naturalChildren adoptedChildren ≤ naturalChildren + 2 := by
  unfold limitedAdoptedHeirs
  split
  · have h1 : Nat.min adoptedChildren 1 ≤ 1 := Nat.min_le_right _ _
    omega
  · have h2 : Nat.min adoptedChildren 2 ≤ 2 := Nat.min_le_right _ _
    omega

/-- Tax is zero at zero. -/
theorem inheritedPortionTax_zero : inheritedPortionTax 0 = 0 := by decide

/-- Boundary sanity: each table band applies at its exact upper edge. -/
example : inheritedPortionTax 10_000_000 = 1_000_000 := by decide
example : inheritedPortionTax 20_000_000 = 2_500_000 := by decide
example : inheritedPortionTax 30_000_000 = 4_000_000 := by decide
example : inheritedPortionTax 50_000_000 = 8_000_000 := by decide
example : inheritedPortionTax 100_000_000 = 23_000_000 := by decide
example : inheritedPortionTax 200_000_000 = 63_000_000 := by decide
example : inheritedPortionTax 300_000_000 = 108_000_000 := by decide
example : inheritedPortionTax 600_000_000 = 258_000_000 := by decide
example : inheritedPortionTax 700_000_000 = 313_000_000 := by decide

/-- Basic deduction boundary checks. -/
example : inheritanceBasicDeduction 0 = 30_000_000 := by decide
example : inheritanceBasicDeduction 1 = 36_000_000 := by decide
example : inheritanceBasicDeduction 2 = 42_000_000 := by decide
example : inheritanceBasicDeduction 3 = 48_000_000 := by decide
example : inheritanceBasicDeduction 10 = 90_000_000 := by decide

/-- Adoption-count limit: 1 adopted per natural child scenario. -/
example : limitedAdoptedHeirs 1 3 = 2 := by decide
example : limitedAdoptedHeirs 2 3 = 3 := by decide
example : limitedAdoptedHeirs 0 1 = 1 := by decide
example : limitedAdoptedHeirs 0 2 = 2 := by decide
example : limitedAdoptedHeirs 0 3 = 2 := by decide

/-- spouse+children boundary: ¥100,000,000 estate, 1 spouse + 1 child,
    tax computed from the two ¥33,000,000 portions vs direct check. -/
example : spouseAndChildrenTotalTax 120_000_000 2 1
    = 2 * inheritedPortionTax ((120_000_000 - 42_000_000) / 2) := by decide

/-- spouse-only scenario: spouse alone takes the whole post-deduction
    portion (art. 16/17 — spouse gets 100% when there are no children). -/
example : spouseAndChildrenTotalTax 120_000_000 1 0
    = inheritedPortionTax (120_000_000 - 36_000_000) := by decide

end JapanTaxLaw
