import JapanTaxLaw.InheritanceTaxArt19_4QuasiApplicationSpec

/-!
# InheritanceTaxArt19_4QuasiApplicationTests — kernel-checked checks

Verifies READING 「前条第二項及び第三項の規定は、第一項の規定を適用する場合について準用する。」: 前条2項/3項 quasi-applied, 第1項 the trigger.
-/

namespace JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication

example : triggerParagraph = Paragraph.para1 := trigger_is_para1
example : quasiAppliedFromPreceding Paragraph.para2 = true := para2_quasi_applied
example : quasiAppliedFromPreceding Paragraph.para3 = true := para3_quasi_applied
example : quasiAppliedFromPreceding Paragraph.para1 = false := trigger_not_quasi_applied
example : SpecQuasiApplied Paragraph.para2 := spec_para2
example : SpecQuasiApplied Paragraph.para3 := spec_para3
example : (quasiAppliedFromPreceding Paragraph.para2 = true) ↔ SpecQuasiApplied Paragraph.para2 := agree_para2
example : (quasiAppliedFromPreceding Paragraph.para1 = false) ↔ ¬ SpecQuasiApplied Paragraph.para1 := agree_para1

end JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication
