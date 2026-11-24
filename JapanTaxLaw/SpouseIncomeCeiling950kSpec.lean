import JapanTaxLaw.SpouseIncomeCeiling950k

/-!
# SpouseIncomeCeiling950k spec — independent restatement of the art. 83_2 spouse income test
Sources (pinned): law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070, art. 83_2 paragraph 1 item 1.
Normative id: NORM|a83c043a9a854501ffc07d437ab7af860fa3490cdfee81771913e2cfa6a3a407
Independent restatement: 九十五万円 = 950000 円。要件は「950000 より大きくない」
として読み、実装の <= とは異なる比較と否定で定式化する。一致は kernel-decided
grid で確認し、仮定しない。
-/

namespace JapanTaxLaw.SpouseIncomeCeiling950k

def specQualifiedSpouse (totalIncome : Nat) : Bool :=
  not (950000 < totalIncome)

example : specQualifiedSpouse 950000 = true := by decide
example : specQualifiedSpouse 950001 = false := by decide

def agreeSpouseIncomeCeiling950k : Bool :=
  [0, 1, 949999, 950000, 950001, 2000000].all fun n =>
    qualifiedSpouse n == specQualifiedSpouse n

example : agreeSpouseIncomeCeiling950k = true := by decide

end JapanTaxLaw.SpouseIncomeCeiling950k
