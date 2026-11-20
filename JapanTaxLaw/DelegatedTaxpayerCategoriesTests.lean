import JapanTaxLaw.DelegatedTaxpayerCategories
import JapanTaxLaw.DelegatedTaxpayerCategoriesSpec

/-!
# DelegatedTaxpayerCategoriesTests — 境界例・仕様一致・法令横断関係
-/
namespace JapanTaxLaw.DelegatedTaxpayerCategoriesTests

open JapanTaxLaw.DelegatedTaxpayerCategories

def wWidow : Widow := fun t => t % 2 == 0
def sSingle : SingleParent := fun t => t % 3 == 0
def gAll : Delegate := fun _ => true
def gNone : Delegate := fun _ => false

-- 仕様一致（実装の Bool 式と独立仕様の対応）
theorem spec_cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat3 w s g t = true ↔
      JapanTaxLaw.DelegatedTaxpayerCategoriesSpec.cat3Spec (w t) (s t) (g t) := by
  simp [D.cat3, JapanTaxLaw.DelegatedTaxpayerCategoriesSpec.cat3Spec]

theorem spec_cat4 (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat4 s g t = true ↔
      JapanTaxLaw.DelegatedTaxpayerCategoriesSpec.cat4Spec (s t) (g t) := by
  simp [D.cat4, JapanTaxLaw.DelegatedTaxpayerCategoriesSpec.cat4Spec]

-- 境界例（委任なしではどちらも成立しない）
example : D.cat3 wWidow sSingle gNone 6 = false := by decide
example : D.cat4 sSingle gNone 6 = false := by decide
example : D.cat3 wWidow sSingle gAll 2 = true := by decide   -- 寡婦のみ
example : D.cat4 sSingle gAll 2 = false := by decide         -- ひとり親でない
example : D.cat3 wWidow sSingle gAll 3 = true := by decide   -- ひとり親のみ
example : D.cat4 sSingle gAll 3 = true := by decide

-- 構造的関係（全称 t）
example (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat4 s g t = true → D.cat3 w s g t = true := D.cat4_implies_cat3 w s g t
example (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat3 w s g t = true ↔ (w t && g t) = true ∨ D.cat4 s g t = true :=
  D.cat3_split w s g t
example (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat3 w s g t = C.cat3 w s g t := cross_law_cat3 w s g t
example (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat4 s g t = true → C.cat3 w s g t = true ∧ D.cat3 w s g t = true :=
  narrowing_both w s g t

end JapanTaxLaw.DelegatedTaxpayerCategoriesTests
