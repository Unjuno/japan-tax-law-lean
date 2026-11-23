/-\!
# TreatyJPUSCoveredTax — 日米租税条約 第二条（対象租税）L3 auxiliary layer

Formalization of the self-contained operators in Article 2 of the Japan–US
income tax treaty (2003, consolidated text), from the pinned, SHA-verified,
text-parsed MOF PDF at data/raw/treaties/JP_US_INCOME_TAX_2003.txt:

  １ この条約は、次の租税について適用する。日本国については、所得税・法人税、
     合衆国については、内国歳入法による連邦所得税（社会保障税を除く。）。
  ２ この条約は、１に掲げる租税…と同一であるもの又は実質的に類似するもの
    についても、適用する。

L3_TREATY auxiliary layer — NOT merged into L0. Concrete tax identifiers are
caller-supplied and NOT MODELLED. Human legal review pending.
-/
namespace JapanTaxLaw.TreatyJPUSCoveredTax

-- 対象租税リストへの所属（第一条1に掲げる租税）
def inTaxList (tax : Nat) (listed : List Nat) : Bool := listed.contains tax

theorem in_list_hit (x : Nat) (xs : List Nat) : inTaxList x (x :: xs) = true := by simp [inTaxList]
theorem in_list_miss (x y : Nat) (xs : List Nat) (h : x ≠ y) :
    inTaxList x (y :: xs) = inTaxList x xs := by
  unfold inTaxList
  simp [h]
theorem in_list_empty (x : Nat) : inTaxList x [] = false := rfl

-- 条約の適用：掲げる租税 又は 同一／実質類似の後継租税
def treatyApplies (listed successor : Bool) : Bool := listed || successor

theorem applies_when_listed (s : Bool) : treatyApplies true s = true := by simp [treatyApplies]
theorem applies_when_successor (l : Bool) : treatyApplies l true = true := by simp [treatyApplies]
theorem no_apply : treatyApplies false false = false := rfl
theorem applies_comm (a b : Bool) : treatyApplies a b = treatyApplies b a := by
  cases a <;> cases b <;> rfl

def coveredTaxDeclared : Bool := true
theorem covered_tax_is_declaration : coveredTaxDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSCoveredTax
