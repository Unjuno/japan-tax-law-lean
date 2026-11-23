/-\!
# TreatyJPUSArtistesAthletes — 日米租税条約 第十六条（芸能人及び運動家）

L3 条約層（別層）。第十六条の金額閾値・帰属例外構造をカーネル証明する：
- １６１：他方で行う芸能・スポーツ活動の所得は当該他方で課税可。ただし総収入が
  課税年度に一万米ドル（円相当額）を超えない場合は課税しない。
- １６２：所得が芸能人・運動家以外の他方居住者に帰属する場合、第七条・第十四条に
  かかわらず活動地国で課税可。ただし帰属者が契約で芸能人等を指名できる場合は除く。

具体的な金額・契約・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSArtistesAthletes

-- １６１：1万ドル閾値を超える場合のみ活動地国で課税
def sourceTaxIfExceeds10000 (grossReceipts : Nat) : Bool := decide (10000 < grossReceipts)
theorem at_10000_no_source_tax : sourceTaxIfExceeds10000 10000 = false := by decide
theorem above_10000_source_tax : sourceTaxIfExceeds10000 10001 = true := by decide
theorem below_10000_no_source_tax : sourceTaxIfExceeds10000 9999 = false := by decide

-- １６２：帰属例外（帰属先が他方居住者 且つ 指名権なし → 活動地国課税）
def attributionException (attributedToOtherResident canDesignatePerformer : Bool) : Bool :=
  attributedToOtherResident && !canDesignatePerformer
theorem attributed_no_designation_source_tax : attributionException true false = true := by decide
theorem designation_no_source_tax : attributionException true true = false := by decide
theorem not_attributed_no_source_tax : attributionException false false = false := by decide

def artistesAthletesDeclared : Bool := true
theorem artistes_athletes_is_declaration : artistesAthletesDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSArtistesAthletes
