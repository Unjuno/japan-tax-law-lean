/-!
# PerItemEnforcementDates — 各号に定める日から施行する（1533 units）

1533 units across 121 revisions in two verbatim variants:
  ただし、次の各号に掲げる規定は、{それぞれ}当該各号に定める日から施行する。

Structure (§3 temporal application): a proviso carves out listed items and gives
each its own enforcement date specified in that item. Formalized as:
  perItemEffective item count dates fallback =
      dates item   if item < count  (item is listed: its own date)
      fallback     otherwise        (not listed: the default date)

The item count, per-item dates and default are caller-supplied; the それぞれ
spelling is the same structure as the base wording. Nothing else is modelled.
-/
namespace JapanTaxLaw.PerItemEnforcementDates

/-- 各号に定める日を返す（呼出側が与える dates: Nat -> Nat）。 -/
def perItemEffective (item count : Nat) (dates : Nat → Nat) (fallback : Nat) : Nat :=
  if item < count then dates item else fallback

theorem listed_item_uses_own_date (item count : Nat) (dates : Nat → Nat) (fallback : Nat)
    (h : item < count) : perItemEffective item count dates fallback = dates item := by
  simp [perItemEffective, h]

theorem unlisted_item_uses_fallback (item count : Nat) (dates : Nat → Nat) (fallback : Nat)
    (h : count <= item) : perItemEffective item count dates fallback = fallback := by
  have hn : ¬ item < count := by omega
  simp [perItemEffective, hn]

theorem listed_unlisted_exclusive (item count : Nat) :
    ¬ (item < count ∧ count <= item) := by
  intro h; omega

theorem listed_unlisted_exhaustive (item count : Nat) : item < count ∨ count <= item := by
  omega

/- 二つの文言変形（「それぞれ」の有無）は同じ構造。 -/
namespace V1
def effective := @perItemEffective
end V1
namespace V2
def effective := @perItemEffective
end V2

theorem spelling_variants_identical (item count : Nat) (dates : Nat → Nat) (fallback : Nat) :
    V1.effective item count dates fallback = V2.effective item count dates fallback := by
  rfl

end JapanTaxLaw.PerItemEnforcementDates
