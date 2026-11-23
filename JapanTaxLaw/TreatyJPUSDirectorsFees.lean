/-\!
# TreatyJPUSDirectorsFees — 日米租税条約 第十五条（役員報酬）

L3 条約層（別層）。第十五条：一方の居住者が他方の居住者である法人の取締役会構成員
として取得する報酬は、当該他方の国で課税できる。具体的な報酬額・身分・法的効力は
NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSDirectorsFees

-- １５：役員報酬は会社居住国で課税可
def directorsFeesTaxableInCompanyState (isDirectorOfCompanyThere : Bool) : Bool :=
  isDirectorOfCompanyThere
theorem director_fees_source_tax : directorsFeesTaxableInCompanyState true = true := by decide
theorem non_director_no_source_tax : directorsFeesTaxableInCompanyState false = false := by decide

def directorsFeesDeclared : Bool := true
theorem directors_fees_is_declaration : directorsFeesDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDirectorsFees
