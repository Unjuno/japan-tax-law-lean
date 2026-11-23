/-\!
# LocalTaxAgencyStatus — 地方税法 第七百六十三条（地方税共同機構の法人格及び住所）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:763

原文の規範構造（2単位）:
- 第1項：機構は、法人とする。（法人格付与）
- 第2項：機構の住所は、その主たる事務所の所在地にあるものとする。（みなし住所）

変数: `hasPrincipalOffice` 主たる事務所の存在。
法人格は宣言的事実（定数）。住所は主たる事務所所在地に固定（みなし）。
-/
namespace JapanTaxLaw.LocalTaxAgencyStatus

-- 法人格：機構は法人（定数事実）
def isJuridicalPerson : Bool := true
theorem agency_is_juridical : isJuridicalPerson = true := rfl

-- みなし住所：主たる事務所所在地を住所とする
def deemedDomicile (hasPrincipalOffice : Bool) : Bool := hasPrincipalOffice
theorem office_gives_domicile : deemedDomicile true = true := by decide
theorem no_office_no_domicile : deemedDomicile false = false := by decide

def localTaxAgencyStatusDeclared : Bool := true
theorem local_tax_agency_status_is_declaration : localTaxAgencyStatusDeclared = true := rfl

end JapanTaxLaw.LocalTaxAgencyStatus
