/-!
# InsurancePremiumExceptions — 325AC0000000226（生命・年金保険料の控除区分）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Eight EXCEPTION units in art.34 (道府県民税) and art.314の2 (市町村民税),
four categories each:
  （１）新生命保険料を支払つた場合（（３）に掲げる場合を除く。）
  （２）旧生命保険料を支払つた場合（（３）に掲げる場合を除く。）
  （３）新個人年金保険料を支払つた場合（（３）に掲げる場合を除く。）
  （４）旧個人年金保険料を支払つた場合（（３）に掲げる場合を除く。）

Structure: the four premium categories (新/旧 × 生命/個人年金) are mutually
exclusive by construction, and every one is subject to the common exclusion
「（３）に掲げる場合を除く」. The two articles have identical structure.

Callers supply the category (0..3) and whether the exclusion applies; the
premium amounts, the content of case （３） and legal effects are NOT MODELLED.
-/
namespace JapanTaxLaw.InsurancePremiumExceptions

/-- 保険料区分: 0=新生命, 1=旧生命, 2=新個人年金, 3=旧個人年金. -/
def categoryCount : Nat := 4

def validCategory (c : Nat) : Bool := decide (c < 4)

/-- （３）に掲げる場合（呼出側が与える除外条件）。 -/
def excluded (b : Bool) : Bool := b

/-- 控除対象区分（除外に該当しなければならない）。 -/
def applies (c : Nat) (ex : Bool) : Bool := validCategory c && !ex

theorem applies_four_categories :
    applies 0 false = true ∧ applies 1 false = true ∧
    applies 2 false = true ∧ applies 3 false = true := by decide

theorem out_of_range (ex : Bool) : applies 4 ex = false := by
  cases ex <;> decide

theorem exclusion_overrides_all (c : Nat) : applies c true = false := by
  simp [applies, validCategory]

theorem categories_pairwise_exclusive (a b : Nat) (h : a ≠ b)
    (ha : a < 4) (hb : b < 4) : ¬ (validCategory a = true ∧ validCategory b = true ∧ a = b) := by
  intro hcat
  exact h hcat.2.2

/-- 新/旧の軸と生命/年金の軸は直交する（4 区分の分解）。 -/
theorem category_decomposition (c : Nat) (hc : c < 4) :
    (c = 0 ∨ c = 1) ∨ (c = 2 ∨ c = 3) := by omega

-- ── 二つの条文（同一構造） ────────────────────────────────────────────
namespace Art34
def applies (c : Nat) (ex : Bool) : Bool := JapanTaxLaw.InsurancePremiumExceptions.applies c ex
end Art34

namespace Art314_2
def applies (c : Nat) (ex : Bool) : Bool := JapanTaxLaw.InsurancePremiumExceptions.applies c ex
end Art314_2

theorem cross_article_applies (c : Nat) (ex : Bool) :
    Art34.applies c ex = Art314_2.applies c ex := by rfl

end JapanTaxLaw.InsurancePremiumExceptions
