import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt21DeemedForeignRegion — DEEMING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|abdefe5d8becbbaf72feb57bf8fe19255467b5f2872b4c2d030feff151188908
  Source path: LawBody[1]/MainProvision/MainProvision[38]/Article:21/Article#21/ArticleCaption

原文逐語（pinned, 一字一句改変なし）:
  ArticleCaption (the needle): 「（外国とみなす地域）」
  Full Article flat text (context from raw JSON): 「（外国とみなす地域）第二十一条この法律の適用については、政令で定める本邦の地域は、当分の間、外国とみなす。」

Norm kind: DEEMING — the ArticleCaption labels the region-deeming rule: a domestic
region designated by Cabinet Order is deemed a foreign country for purposes of
this Act. The computable slice models the region-status discrimination: which
statuses are deemed foreign by the provision. The designation itself (政令で定める),
the temporal qualifier (当分の間), and legal correctness are NOT MODELLED.
All statutory facts derived from the needle and the raw article text; no hand-typed CJK.

Variable contract (meaning / domain / type):
  RegionStatus : Type — domestic, designatedDomestic (政令で定める本邦の地域), foreign.
  isDeemedForeign : RegionStatus -> Bool — true only for designatedDomestic.
  No numeric amount/unit applies (structural DEEMING, not a formula).

Scope: only the region-status deeming discrimination. Cabinet Order designation,
the 当分の間 qualifier, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion

/-- The region statuses relevant to the deeming rule. -/
inductive RegionStatus : Type
  | domestic : RegionStatus
  | designatedDomestic : RegionStatus
  | foreign : RegionStatus

/-- 外国とみなす: a designated domestic region is deemed foreign. -/
def isDeemedForeign (r : RegionStatus) : Bool :=
  match r with
  | RegionStatus.designatedDomestic => true
  | RegionStatus.domestic => false
  | RegionStatus.foreign => false

/-- A designated domestic region is deemed foreign. -/
theorem designated_deemed_foreign :
    isDeemedForeign RegionStatus.designatedDomestic = true := rfl

/-- An ordinary domestic region is not deemed foreign by this provision. -/
theorem domestic_not_deemed : isDeemedForeign RegionStatus.domestic = false := rfl

/-- A region already foreign is not the object of this deeming. -/
theorem foreign_not_deemed : isDeemedForeign RegionStatus.foreign = false := rfl

end JapanTaxLaw.CustomsTariffArt21DeemedForeignRegion
