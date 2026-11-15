import JapanTaxLaw.TaxFinance

/-!
# InheritanceSurcharge — 相続税法 art. 18 （相続税額の加算） L4 computation slice

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Art. 18 （相続税額の加算） — verbatim:

  相続又は遺贈により財産を取得した者が、当該相続又は遺贈に係る被相続人の
  一親等の血族（当該被相続人の直系卑属が相続開始以前に死亡し、又は相続権を
  失つたため、代襲して相続人となつた当該被相続人の直系卑属を含む。）及び
  配偶者以外の者である場合においては、その者に係る相続税額は、前条の規定に
  かかわらず、同条の規定により算出した金額にその百分の二十に相当する金額を
  加算した金額とする。(art. 18(1))

  前項の一親等の血族には、同項の被相続人の直系卑属が
  当該被相続人の養子となつている場合を含まないものとする。ただし、当該
  被相続人の直系卑属が相続開始以前に死亡し、又は相続権を失つため、代襲して
  相続人となつている場合は、この限りでない。(art. 18(2))

Implemented as: given art. 17's computed tax amount and an externally-
established boolean (is the heir a 一親等の血族 or spouse?), add 20% to inherit
the final tax amount. Art. 18(2)'s exclusion: lineal descendants that are
adopted into the family do **not** count as 一親等の血族 (except via代襲). We
model the "is exempt blood relative or spouse" decision as an externally-
established boolean (`isEligibleRelativeOrSpouse`), because per-instance
determination requires family-relation facts not available at this slice.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 18(1): the surcharge multiplier. 百分の二十に相当する金額 = 20%. -/
def inheritanceSurcharge : TaxRate := ⟨20, 100, by decide⟩

/-- Art. 17 baseline tax on an heir, before art. 18 adjustment.
    This module takes the art. 17 amount as an input until the full art. 17
    computation is modelled (done in `InheritanceTax.lean` for the
    spouse+children case); other scenarios use caller-supplied inputs. -/
def surcharge20 (baseTax : Money) : Money := (baseTax * 20) / 100

/-- art. 18: if the heir is neither spouse nor eligible blood relative,
    the art. 17 amount is multiplied by 1.2 (one hundred plus twenty percent). -/
def taxWithSurcharge (isEligibleRelativeOrSpouse : Bool) (taxArt17 : Money) : Money :=
  if isEligibleRelativeOrSpouse then
    taxArt17
  else
    taxArt17 + surcharge20 taxArt17

-- ==== verified facts ====

theorem surcharge20_zero : surcharge20 0 = 0 := by decide
theorem surcharge20_100 : surcharge20 100 = 20 := by decide
example : surcharge20 250 = 50 := by decide

/-- The eligible relative's tax equals the art. 17 amount exactly. -/
example : taxWithSurcharge true 1_000_000 = 1_000_000 := by decide

/-- The surcharge applies additively and multiplies by 1.2. -/
example : taxWithSurcharge false 1_000_000 = 1_200_000 := by decide
example : taxWithSurcharge false 0 = 0 := by decide
example : taxWithSurcharge false 125 = 150 := by decide

end JapanTaxLaw
