/-\!
# LocalBusinessTaxExemption — 地方税法 第七十二条の四（事業税の非課税法人）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:72_4

原文の規範構造：道府県は、国及び次に掲げる法人が行う事業に対しては事業税を
課することができない（非課税）。対象2単位は号1の区分:
- 都道府県、市町村、特別区、これらの組合及び合併特例区その他政令で定める公共団体
- 法人税法別表第一に規定する独立行政法人

変数: `publicCorp` 公共団体等, `incorporatedAgency` 独立行政法人,
その他号 : 号1の二〜四の各区分（呼出側が与える）。
非課税 = いずれかの号に該当すれば事業税を課さない。
-/
namespace JapanTaxLaw.LocalBusinessTaxExemption

-- 非課税判定：国 又は いずれかの号に該当 → 課税不可
def businessTaxExempt (isState publicCorp incAgency other : Bool) : Bool :=
  isState || publicCorp || incAgency || other
theorem state_exempt : businessTaxExempt true false false false = true := by decide
theorem public_corp_exempt : businessTaxExempt false true false false = true := by decide
theorem inc_agency_exempt : businessTaxExempt false false true false = true := by decide
theorem none_not_exempt : businessTaxExempt false false false false = false := by decide

-- 課税可否：非課税でなければ課税しうる
def mayTaxBusiness (exempt : Bool) : Bool := !exempt
theorem exempt_not_taxed : mayTaxBusiness true = false := by decide
theorem nonexempt_may_tax : mayTaxBusiness false = true := by decide

def localBusinessTaxExemptionDeclared : Bool := true
theorem local_business_tax_exemption_is_declaration : localBusinessTaxExemptionDeclared = true := rfl

end JapanTaxLaw.LocalBusinessTaxExemption
