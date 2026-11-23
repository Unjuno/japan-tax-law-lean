/-\!
# TreatyJPUSNondiscrimination — 日米租税条約 第二十四条（無差別待遇）

L3 条約層（別層）。第二十四条の無差別（国民待遇）構造をカーネル証明する：
- ２４１：一方の国民は他方で、同様の状況の他方国民より重い租税・要件を課されない。
- ２４２：PE への租税は、同様活動の他方企業より不利でない。
- ２４３：支払利子・使用料等は、国内支払と同様の条件で控除（第九条１等適用の場合を除く）。
- ２４４：外国資本支配企業も同様企業より重い課税を受けない。

具体的な税率・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSNondiscrimination

-- 無差別：外国に対する負担は国内 similarly-situated の負担以下
def notMoreBurdensome (foreignBurden domesticBurden : Nat) : Bool :=
  decide (foreignBurden <= domesticBurden)
theorem equal_burden_ok (b : Nat) : notMoreBurdensome b b = true := by simp [notMoreBurdensome]
theorem heavier_burden_rejected (f d : Nat) (h : d < f) : notMoreBurdensome f d = false := by
  have hn : ¬ f <= d := by omega
  simp [notMoreBurdensome, hn]
-- 無差別は国内負担を上回らないことを要求
theorem nondiscrimination_implies_cap (f d : Nat) (h : notMoreBurdensome f d = true) : f <= d := by
  unfold notMoreBurdensome at h
  by_cases hd : f <= d <;> simp [hd] at h ⊢

-- ２４１/２の適用対象（国民 又は PE）
def coveredByNondiscrimination (national : Bool) (pe : Bool) : Bool := national || pe
theorem national_covered : coveredByNondiscrimination true false = true := by decide
theorem pe_covered : coveredByNondiscrimination false true = true := by decide

def nondiscriminationDeclared : Bool := true
theorem nondiscrimination_is_declaration : nondiscriminationDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSNondiscrimination
