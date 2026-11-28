import JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException

/-!
# CustomsTariffArt15ExhibitionGoodsScopeExceptionSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.15(1) item5の2 EXCEPTION 「ただし、博覧会等の開催の期間及び規模、物品の種類及び価格その他の事情を勘案して相当と認められるものに限る。」.
Normative unit: NORM|b8c681082e69caab3f288bf5c824986816c4dde9fb96a4ff4338c23802a970a4

The implementation uses a Bool conjunction; the spec states the same gate as a
Prop conjunction of three equalities, representationally distinct. Agreement is
proved by exhaustive cases in the kernel. Axiom-free; no decide/simp/propext.

Not modelled: what counts as reasonable, the exhibition itself, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException

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

end JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException
