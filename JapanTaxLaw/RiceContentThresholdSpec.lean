import JapanTaxLaw.RiceContentThreshold

/-!
# RiceContentThreshold spec — 30% 厳密超えの独立定式
Sources (pinned): law 344M50000040039, revision 344M50000040039_20241215_505M60000040057.
Independent restatement: rice*100 > total*30。
-/

namespace JapanTaxLaw.RiceContentThreshold

def specExceeds (rice : Nat) (total : Nat) : Bool := rice * 100 > total * 30

example : specExceeds 30 100 = false := by decide
example : specExceeds 31 100 = true := by decide

def agreeRiceContentThreshold : Bool :=
  [(0,100),(29,100),(30,100),(31,100),(60,200),(61,200),(1,1000)].all fun rt =>
    exceedsRiceThreshold rt.1 rt.2 == specExceeds rt.1 rt.2

example : agreeRiceContentThreshold = true := by decide

end JapanTaxLaw.RiceContentThreshold
