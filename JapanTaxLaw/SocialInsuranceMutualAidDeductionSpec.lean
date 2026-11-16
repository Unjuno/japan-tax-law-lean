import JapanTaxLaw.SocialInsuranceMutualAidDeduction

/-!
# SocialInsuranceMutualAidDeduction spec — independent restatement of
  地方税法 art. 34(1)第三号（社会保険料控除）・art. 34(1)第四号（小規模企業共済等掛金控除）

Sources (pinned; identical to SocialInsuranceMutualAidDeduction.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of:
  * art. 34(1)第三号 — 支払った（又は給与から控除される）社会保険料等の金額そのまま。
  * art. 34(1）第四号 — 小規模企業共済法に規定する共済契約の掛金／確定拠出年金法に規定する
    企業型年金加入者掛金・個人型年金加入者掛金／条例による精神又は身体に障害のある者共済制度で
    政令で定めるものに係る契約に基づく掛金の合計額。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(1)第三号 社会保険料控除額（そのまま）。 -/
def specSocialInsuranceDeduction (paidOrWithheld : Money) : Money := paidOrWithheld

/-- Spec: art. 34(1)第四号 小規模企業共済等掛金控除額（合計額）。 -/
def specSmallEnterpriseMutualAidDeduction (a b c : Money) : Money := a + b + c

example : specSocialInsuranceDeduction 0 = 0 := by decide
example : specSocialInsuranceDeduction 234_567 = 234_567 := by decide
example : specSocialInsuranceDeduction 1_000_000_000 = 1_000_000_000 := by decide

example : specSmallEnterpriseMutualAidDeduction 0 0 0 = 0 := by decide
example : specSmallEnterpriseMutualAidDeduction 100_000 0 0 = 100_000 := by decide
example : specSmallEnterpriseMutualAidDeduction 0 200_000 0 = 200_000 := by decide
example : specSmallEnterpriseMutualAidDeduction 0 0 300_000 = 300_000 := by decide
example : specSmallEnterpriseMutualAidDeduction 100_000 200_000 300_000 = 600_000 := by decide
example : specSmallEnterpriseMutualAidDeduction 9_999_999 9_999_999 9_999_999 = 29_999_997 := by decide

def agreeSocialInsurancePoints : Bool :=
  [0, 1, 100_000, 234_567, 1_000_000_000].all fun x =>
    socialInsuranceDeduction x == specSocialInsuranceDeduction x

example : agreeSocialInsurancePoints = true := by decide

def agreeSmallEnterprisePoints : Bool :=
  [(0, 0, 0), (100_000, 0, 0), (0, 200_000, 0), (0, 0, 300_000),
   (100_000, 200_000, 300_000), (9_999_999, 9_999_999, 9_999_999)].all fun (a, b, c) =>
    smallEnterpriseMutualAidDeduction ⟨a, b, c⟩ == specSmallEnterpriseMutualAidDeduction a b c

example : agreeSmallEnterprisePoints = true := by decide

end JapanTaxLaw
