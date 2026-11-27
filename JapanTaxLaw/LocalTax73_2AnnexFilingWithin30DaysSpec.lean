import JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days

/-
# LocalTax73_2AnnexFilingWithin30DaysSpec — independent spec for 地方税法 Num 73_2/7

Needle 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days
