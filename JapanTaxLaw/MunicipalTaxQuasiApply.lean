/-!
# MunicipalTaxQuasiApply — 329M50000002023 art.13_4（個人の市町村民税への準用）

Pinned source: data/raw/329M50000002023_20261101_508M60000008045.law.json
source_path: LawBody[3]/SupplProvision/SupplProvision[87]/Article:13_4/Article#13_4/Paragraph#3/ParagraphSentence/Sentence#1
原文（23文字, 独立抽出で照合）:「第一項の規定は、個人の市町村民税について準用する。」

規範単位（READING / 準用）: 第一項の規定を「個人の市町村民税」に準用する。
  - targetCategory: 租税目の区分（Nat コード、caller-established）
  - individualMunicipalTaxCode: 原文「個人の市町村民税」に対応する区分
第一項の具体的な規定内容・読み替え字句・他の税目への適用は当該単位外で
NOT MODELLED。
-/
namespace JapanTaxLaw.MunicipalTaxQuasiApply

/-- 原文「個人の市町村民税」に対応する区分コード（caller-established な符号化）。 -/
def individualMunicipalTaxCode : Nat := 1

/-- 準用の対象判定: 個人の市町村民税であれば第一項が準用される。 -/
def quasiApplies (targetCategory : Nat) : Bool :=
  decide (targetCategory == individualMunicipalTaxCode)

theorem applies_to_individual_municipal : quasiApplies 1 = true := by decide
theorem rejects_other_category : quasiApplies 2 = false := by decide
theorem rejects_zero : quasiApplies 0 = false := by decide

/-- 一般命題: 準用は原文の対象区分と同値。 -/
theorem quasiApplies_iff (t : Nat) :
    quasiApplies t = true ↔ t = individualMunicipalTaxCode := by
  simp [quasiApplies]

end JapanTaxLaw.MunicipalTaxQuasiApply
