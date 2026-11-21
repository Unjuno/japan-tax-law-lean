import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt21Deeming — 関税定率法 第二十一条(1)（外国とみなす地域）DEEMING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|1171722dae792afda3c164ba383e239e77bbd936df4f4d007090778db64ea0dc
  Source path: LawBody[1]/MainProvision/MainProvision[38]/Article:21/Article#21/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （外国とみなす地域）

原文逐語（pinned, 一字一句改変なし）:
  「この法律の適用については、政令で定める本邦の地域は、当分の間、外国とみなす。」

Norm kind: DEEMING — a scoped legal fiction. For the application of this Act
(この法律の適用については), a 本邦の地域 that is 政令で定める is, during 当分の間,
外国とみなす. Three conditions conjunctively trigger the fiction:
  (1) the region is a 本邦の地域 (domestic region, actual status = domestic),
  (2) it is 政令で定める (designated by Cabinet Order),
  (3) it is 当分の間 (within the provisional period).
Effect: 外国とみなす — treated as foreign FOR THIS ACT'S APPLICATION only.

Variable contract (meaning / domain / type):
  RegionStatus : Type — actual status of a region (domestic | foreign).
  Region : structure — actualStatus : RegionStatus, designatedByCabinetOrder : Bool.
  inProvisionalPeriod : Bool — whether 当分の間 holds. Its precise temporal bounds
    are NOT modeled (the statute fixes no dates); it is an explicit parameter.
  No numeric amount/unit/dimension applies (structural DEEMING, not a formula).

Faithfulness: the deeming changes only the for-this-Act *treatment*, never the
region's actualStatus field. The fiction is scoped, not identity-changing.

Scope: only this deeming rule. The identity of designated regions, the actual
commencement/end of 当分の間, other paragraphs/articles and legal correctness are
NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt21Deeming

/-- 本邦の地域の実際の地位 (actual status; 本邦の地域 / foreign). -/
inductive RegionStatus : Type
  | domestic : RegionStatus   -- 本邦の地域
  | foreign : RegionStatus    -- 外国

deriving instance DecidableEq for RegionStatus

/-- 政令で定める本邦の地域: a region's actual status + Cabinet-order designation. -/
structure Region where
  actualStatus : RegionStatus
  designatedByCabinetOrder : Bool   -- 政令で定める

/-- この法律の適用については…外国とみなす: for-this-Act treatment. -/
def treatedAsForThisAct (r : Region) (inProvisionalPeriod : Bool) : RegionStatus :=
  if r.actualStatus == RegionStatus.domestic && r.designatedByCabinetOrder && inProvisionalPeriod
  then RegionStatus.foreign
  else r.actualStatus

end JapanTaxLaw.CustomsTariffArt21Deeming
