/-\!
# InheritanceTaxCloselyHeld — 相続税法 第六十六条の二（特定一般社団法人等）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json Article:66_2

原文の規範構造（対象2単位）:
- 号3イ：特定一般社団法人等の要件 — 相続開始直前の同族理事数 / 理事総数 の割合が
  「二分の一を超える」こと。
- 第3項の第一条の三適用特例：特定一般社団法人等の住所は、その主たる事務所の
  所在地にあるものとする（みなし住所）。

変数の意味・単位・定義域:
  familyDirectors : Nat — 同族理事数（人）、0 <= familyDirectors
  totalDirectors : Nat — 理事総数（人）、総数 > 0 を想定
  ratio = familyDirectors / totalDirectors（無次元）

「二分の一を超える」判定を整数演算で表現:
  familyDirectors / totalDirectors > 1/2 ⟺ 2 × familyDirectors > totalDirectors

「住所は主たる事務所の所在地」は被相続人の住所判定を本店所在地に固定する。
-/
namespace JapanTaxLaw.InheritanceTaxCloselyHeld

-- 同族理事割合 > 1/2 判定（整数演算、total > 0）
def exceedsHalf (familyDirectors totalDirectors : Nat) : Bool :=
  decide (2 * familyDirectors > totalDirectors)

theorem all_family_exceeds (n : Nat) (h : n > 0) : exceedsHalf n n = true := by
  unfold exceedsHalf
  simp [Nat.mul_comm]
  omega
theorem no_family_not_exceeds (n : Nat) (h : n > 0) : exceedsHalf 0 n = false := by
  unfold exceedsHalf
  simp
theorem half_exactly_not_exceeds (n : Nat) : exceedsHalf n (2 * n) = false := by
  unfold exceedsHalf
  simp [Nat.mul_comm, Nat.mul_assoc]
-- 同族が過半数なら 2*family > total
theorem majority_implies_exceeds (f t : Nat) (h : f <= t) (h2 : t < 2 * f) :
    exceedsHalf f t = true := by
  unfold exceedsHalf
  simp
  exact h2

-- みなし住所：主たる事務所所在地を住所として扱う（Bool で「主たる事務所に住所あり」）
def deemedDomicile (hasPrincipalOffice : Bool) : Bool := hasPrincipalOffice
theorem office_gives_domicile : deemedDomicile true = true := by decide
theorem no_office_no_domicile : deemedDomicile false = false := by decide

def inheritanceTaxCloselyHeldDeclared : Bool := true
theorem inheritance_tax_closely_held_is_declaration : inheritanceTaxCloselyHeldDeclared = true := rfl

end JapanTaxLaw.InheritanceTaxCloselyHeld
