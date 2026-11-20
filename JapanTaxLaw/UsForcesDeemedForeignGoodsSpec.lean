import JapanTaxLaw.UsForcesDeemedForeignGoods

/-!
# UsForcesDeemedForeignGoodsSpec — independent spec for 327AC0000000112 art.12(6)

Law id: 327AC0000000112
Revision: 327AC0000000112_20190317_429AC0000000013
Statutory article: art. 12(6) — 関税法の適用については外国貨物とみなす
Normative unit: NORM|9a9d622241c1736e9375241d59f25ec74ed16132c017d586ca0a7e96c9fd5751

The implementation uses boolean AND with `ctx == customsLaw`. The spec is a
deliberately different, case-analysis formulation that pattern-matches on the
legal context and only consults the paragraph-1 flag under 関税法. The kernel
proves equivalence for ALL inputs (both Bool values × both contexts).

Scope properties proved:
- the deeming fires only under 関税法 (no leak to other statutes);
- goods not receiving paragraph 1 are never deemed foreign goods;
- the deeming is monotone in the paragraph-1 flag within 関税法.

Not modelled: art.12(1) substance, the 関税法 definition of 外国貨物, other
paragraphs, the status-of-forces treaty background and 政令 details.
-/

namespace JapanTaxLaw.UsForcesDeemedForeignGoods

/-- Independent spec: case analysis on context, flag consulted only under 関税法. -/
def specDeemedForeignGoods (receivesParagraph1 : Bool) (ctx : LegalContext) : Bool :=
  match ctx with
  | LegalContext.customsLaw => receivesParagraph1
  | LegalContext.otherLaw => false

/-- Correspondence for all inputs (Bool × LegalContext, exhaustive). -/
theorem agree_deemed_foreign_goods (receivesParagraph1 : Bool) (ctx : LegalContext) :
    deemedForeignGoods receivesParagraph1 ctx =
      specDeemedForeignGoods receivesParagraph1 ctx := by
  cases ctx <;> cases receivesParagraph1 <;> rfl

/-- The deeming never leaks to a context other than 関税法. -/
theorem no_deeming_under_other_law (receivesParagraph1 : Bool) :
    deemedForeignGoods receivesParagraph1 LegalContext.otherLaw = false := by
  cases receivesParagraph1 <;> decide

/-- Goods not receiving paragraph 1 are never deemed foreign goods (any context). -/
theorem no_deeming_without_paragraph1 (ctx : LegalContext) :
    deemedForeignGoods false ctx = false := by
  cases ctx <;> decide

/-- Within 関税法 the deeming is monotone in the paragraph-1 flag. -/
theorem deeming_monotone_customs {a b : Bool} (h : a = true -> b = true) :
    deemedForeignGoods a LegalContext.customsLaw = true ->
      deemedForeignGoods b LegalContext.customsLaw = true := by
  cases a <;> cases b
  · decide
  · decide
  · cases h rfl
  · decide

/-- Finite smoke check only; `agree_deemed_foreign_goods` is the universal proof. -/
def checkDeemedForeignGoods : Bool :=
  deemedForeignGoods true LegalContext.customsLaw == true &&
  deemedForeignGoods true LegalContext.otherLaw == false &&
  deemedForeignGoods false LegalContext.customsLaw == false

example : checkDeemedForeignGoods = true := by decide

end JapanTaxLaw.UsForcesDeemedForeignGoods
