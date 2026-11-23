import JapanTaxLaw.ShareRatioOverHalf

/-!
# ShareRatioOverHalf spec — 50% 厳密超えの独立定式
Sources (pinned): law 344M50000048001, revision 344M50000048001_20260601_508M60000048004.
Independent restatement: share*2 > total（50%超えを 2 倍比較で表現）。
-/

namespace JapanTaxLaw.ShareRatioOverHalf

def specOverHalf (s : Nat) (t : Nat) : Bool := s * 2 > t

example : specOverHalf 50 100 = false := by decide
example : specOverHalf 51 100 = true := by decide

def agreeShareRatioOverHalf : Bool :=
  [(0,100),(49,100),(50,100),(51,100),(100,200),(101,200),(1,1000)].all fun st =>
    exceedsHalf st.1 st.2 == specOverHalf st.1 st.2

example : agreeShareRatioOverHalf = true := by decide

end JapanTaxLaw.ShareRatioOverHalf
