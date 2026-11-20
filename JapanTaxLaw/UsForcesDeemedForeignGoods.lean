import JapanTaxLaw.TaxFinance

/-!
# UsForcesDeemedForeignGoods — art.12(6)（関税法の適用について外国貨物とみなす）

Pinned source:
  Law id: 327AC0000000112
  Revision: 327AC0000000112_20190317_429AC0000000013
  Raw snapshot: data/raw/327AC0000000112_20190317_429AC0000000013.law.json
  sha256: ca251c418b17aef8e9205d8f53417c14214ee9840579bf69e75828e4d9cc1a6d
  Normative unit id: NORM|9a9d622241c1736e9375241d59f25ec74ed16132c017d586ca0a7e96c9fd5751
  Source path: LawBody[1]/MainProvision/MainProvision[11]/Article:12/Article#12/
               Paragraph#6/ParagraphSentence/Sentence#1
  Statutory article: art. 12(6) (DEEMING / cross-law reference to 関税法)

原文逐語（pinned, 一字一句改変なし）:
  「第一項の規定の適用を受ける物品は、関税法の適用については、同法の外国貨物とみなす。」

Variable contract:
  `receivesParagraph1 : Bool` = whether the goods receive the application of
  art.12(1) (第一項の規定の適用を受ける物品).
  `ctx : LegalContext` = the legal context in which the goods are considered;
  `customsLaw` = 関税法の適用, `otherLaw` = any other statute's application.
  Result: whether the goods are deemed 外国貨物 (foreign goods) of 関税法.
  The deeming is EXPRESSLY scoped to 関税法の適用については — it does not apply
  under other laws. Unit: Bool (propositional status); domain Bool × LegalContext.

Scope: only this scoped deeming rule. `deemedForeignGoods = false` means the
DEEMING does not fire, NOT that the goods are not 外国貨物 under 関税法 — ordinary
関税法 classification is a separate matter and is NOT MODELLED. The substantive
content of art.12(1), the definition of 外国貨物 in 関税法, the second sentence of
paragraph 6, other paragraphs, the status-of-forces treaty background and 政令
details are NOT MODELLED. Computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.UsForcesDeemedForeignGoods

/-- The legal context in which the goods are assessed. -/
inductive LegalContext where
  | customsLaw  -- 関税法の適用については
  | otherLaw    -- any other statute
  deriving BEq, DecidableEq

/-- 「関税法の適用については、同法の外国貨物とみなす」: the deeming holds
    exactly when the goods receive paragraph 1 AND the context is 関税法. -/
def deemedForeignGoods (receivesParagraph1 : Bool) (ctx : LegalContext) : Bool :=
  receivesParagraph1 && (ctx == LegalContext.customsLaw)

end JapanTaxLaw.UsForcesDeemedForeignGoods
