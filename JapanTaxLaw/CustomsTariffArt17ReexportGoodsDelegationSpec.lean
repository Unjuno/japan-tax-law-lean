import JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation

/-!
# CustomsTariffArt17ReexportGoodsDelegationSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.17(1) item11 DELEGATION 「条約の規定により輸入の後一定の期間内に輸出されることを条件として関税を免除することとされている貨物で政令で定めるもの」。
Normative unit: NORM|7683650c1eee7e91e43bab06f869a0234b89d07aab791ea50dc7ebb7f077e00f

The implementation uses a Bool conjunction; the spec states the same gate as a
Prop conjunction of three equalities, representationally distinct. Agreement is
proved by exhaustive cases in the kernel. Axiom-free; no decide/simp/propext.

Not modelled: treaty content, period length, cabinet-order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation

/-- Independent spec: all three gates hold as Props. -/
def SpecInScope (a b c : Bool) : Prop :=
  a = true ∧ b = true ∧ c = true

/-- The implementation agrees with the spec. -/
theorem spec_agreement (a b c : Bool) : inScope a b c = true ↔ SpecInScope a b c := by
  cases a with
  | false =>
      constructor
      · intro h; cases h
      · intro h; cases h with | intro ha rest => cases ha
  | true =>
      cases b with
      | false =>
          constructor
          · intro h; cases h
          · intro h; cases h with | intro ha rest => cases rest with | intro hb hc => cases hb
      | true =>
          cases c with
          | false =>
              constructor
              · intro h; cases h
              · intro h; cases h with | intro ha rest => cases rest with | intro hb hc => cases hc
          | true =>
              constructor
              · intro h; exact ⟨rfl, rfl, rfl⟩
              · intro h; rfl

end JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation
