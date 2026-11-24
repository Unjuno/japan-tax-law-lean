import JapanTaxLaw.UnclearValueDefault

/-!
# UnclearValueDefaultSpec — 独立仕様と全称の代替対応証明

The spec is a proposition on the Option input, independent of the
implementation's `match`. The theorem proves agreement for ALL inputs by case
analysis on `Option`.
-/

namespace JapanTaxLaw.UnclearValueDefault

/-- 独立仕様: 不明なら 19、既知ならその値。 -/
def specResolved (known : Option Nat) (rate : Nat) : Prop :=
  (known = none → rate = 19) ∧
  (∀ v, known = some v → rate = v)

/-- 実装 ≡ 独立仕様（全称、Option 上の場合分け）。 -/
theorem agreeResolve (known : Option Nat) :
    specResolved known (resolveRate known) := by
  unfold specResolved
  cases known with
  | none =>
      constructor
      · intro _; unfold resolveRate defaultPerMille; rfl
      · intro v h; cases h
  | some v =>
      constructor
      · intro h; cases h
      · intro w h; cases h; unfold resolveRate; rfl

/-- 代替値そのものの境界。 -/
example : defaultPerMille = 19 := by decide
example : resolveRate none = 19 := by decide
example : resolveRate (some 0) = 0 := by decide

end JapanTaxLaw.UnclearValueDefault
