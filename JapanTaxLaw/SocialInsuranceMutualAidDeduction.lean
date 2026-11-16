import JapanTaxLaw.TaxFinance

/-!
# SocialInsuranceAndSmallEnterpriseDeduction — 地方税法 art. 34(1)第三号（社会保険料控除）・
  art. 34(1)第四号（小規模企業共済等掛金控除）L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as LocalIncomeTax.lean / LocalInsuranceDeduction.lean / DisasterLossDeduction.lean)

Models art. 34(1)第三号 and art. 34(1)第四号 — pinned bytes 逐語:

  「三前年中に自己又は自己と生計を一にする配偶者その他の親族の負担すべき社会保険料（所得税法第七十四条第二項に規定する社会保険料（租税特別措置法第四十一条の七第二項において社会保険料とみなされる金銭の額を含む。）をいう。）を支払つた、又は給与から控除される所得割の納税義務者その支払つた、又は給与から控除される金額」

  「四前年中に次に掲げる掛金を支払つた所得割の納税義務者その支払つた金額の合計額イ小規模企業共済法（昭和四十年法律第百二号）第二条第二項に規定する共済契約（政令で定めるものを除く。）に基づく掛金ロ確定拠出年金法（平成十三年法律第八十八号）第三条第三項第七号の二に規定する企業型年金加入者掛金又は同法第五十五条第二項第四号に規定する個人型年金加入者掛金ハ条例の規定により地方公共団体が精神又は身体に障害のある者に関して実施する共済制度で政令で定めるものに係る契約に基づく掛金」

The two deductions are caller-supplied totals — no bracket logic, no caps in the statute.

Out of scope:

* 社会保険料の定義（所得税法第七十四条第二項（国民年金・厚生年金・公的医療保険 etc.）＋ 租税特別措置法第四十一条の七第二項等において社会保険料とみなされる金銭（出産手当金等に係る返還金をDiscretionaryに納付期）の区分 — 非モデル化、caller-established 金額
* art. 34(1)第十一号（控除の順序）— 非モデル化
* 抑制小規模企業共済掛金契約は「政令で定めるものを除く。」の適用可否 — 呼出元責任

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 34(1)第三号 社会保険料控除額: 支払った（又は給与から控除された）社会保険料等の金額そのまま。 -/
def socialInsuranceDeduction (paidOrWithheld : Money) : Money := paidOrWithheld

/-- art. 34(1)第四号 小規模企業共済等掛金控除の caller-established inputs. -/
structure SmallEnterpriseMutualAidFacts where
  /-- イ: 小規模企業共済法（昭和四十年法律第百二号）第二条第二項に規定する共済契約に基づく掛金。 -/
  smallEnterpriseMutualAidContributions : Money
  /-- ロ: 確定拠出年金法（平成十三年法律第八十八号）第三条第三項第七号の二に規定する
       企業型年金加入者掛金又は同法第五十五条第二項第四号に規定する個人型年金加入者掛金。 -/
  definedContributionPensionContributions : Money
  /-- ハ: 条例の規定により地方公共団体が精神又は身体に障害のある者に関して実施する
       共済制度で政令で定めるものに係る契約に基づく掛金。 -/
  localDisabilityMutualAidContributions : Money
  deriving DecidableEq, Repr

/-- art. 34(1)第四号 小規模企業共済等掛金控除額: イ＋ロ＋ハ の合計額。 -/
def smallEnterpriseMutualAidDeduction (f : SmallEnterpriseMutualAidFacts) : Money :=
  f.smallEnterpriseMutualAidContributions + f.definedContributionPensionContributions + f.localDisabilityMutualAidContributions

theorem socialInsuranceDeduction_eq (x : Money) : socialInsuranceDeduction x = x := rfl

theorem smallEnterpriseMutualAidDeduction_zero (f : SmallEnterpriseMutualAidFacts)
    (h0 : f.smallEnterpriseMutualAidContributions = 0)
    (h1 : f.definedContributionPensionContributions = 0)
    (h2 : f.localDisabilityMutualAidContributions = 0) :
    smallEnterpriseMutualAidDeduction f = 0 := by
  unfold smallEnterpriseMutualAidDeduction
  rw [h0, h1, h2]

theorem smallEnterpriseMutualAidDeduction_mono {f g : SmallEnterpriseMutualAidFacts}
    (h1 : f.smallEnterpriseMutualAidContributions ≤ g.smallEnterpriseMutualAidContributions)
    (h2 : f.definedContributionPensionContributions ≤ g.definedContributionPensionContributions)
    (h3 : f.localDisabilityMutualAidContributions ≤ g.localDisabilityMutualAidContributions) :
    smallEnterpriseMutualAidDeduction f ≤ smallEnterpriseMutualAidDeduction g := by
  unfold smallEnterpriseMutualAidDeduction
  exact Nat.add_le_add (Nat.add_le_add h1 h2) h3

-- ==== kernel-decided smoke checks ====

example : socialInsuranceDeduction 0 = 0 := by decide
example : socialInsuranceDeduction 100_000 = 100_000 := by decide
example : socialInsuranceDeduction 1_000_000_000 = 1_000_000_000 := by decide

example : smallEnterpriseMutualAidDeduction ⟨0, 0, 0⟩ = 0 := by decide
example : smallEnterpriseMutualAidDeduction ⟨100_000, 0, 0⟩ = 100_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨0, 200_000, 0⟩ = 200_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨0, 0, 300_000⟩ = 300_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨100_000, 200_000, 300_000⟩ = 600_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨10, 0, 0⟩ = 10 := by decide

end JapanTaxLaw
