import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt48To50DeletedRange — STRUCTURE

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000226_*.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|76351db6bc4ddafec1d36f9bb70e5fe0fa5aa6eafa4db90ea65f76e66c3050ee
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:48:50/Article#48:50/ArticleTitle

原文逐語（pinned, 一字一句改変なし）:
  ArticleTitle: 「第四十八条から第五十条まで」
  Full Article flat text: 「第四十八条から第五十条まで削除」

Norm kind: STRUCTURE — the ArticleTitle of a repeal/deletion note. The computable
slice models the article-number range named in the title: exactly articles 48,
49 and 50 fall in the range 「第四十八条から第五十条まで」 (from ... to ...), i.e. the
articles marked deleted by the note. The numbers 48 and 50 were parsed
programmatically from the kanji numerals in the needle, not hand-typed.

Variable contract (meaning / domain / type):
  n : Nat — an article number (unit: ordinal article number; domain: positive integers).
  inDeletedRange : Nat -> Bool — true iff n is one of the articles in the range.
  SpecDeletedRange : Nat -> Prop — independent Prop disjunction (n=48 or 49 or 50).

Scope: only the article-number range discrimination of the title. The legal effect
of the repeal, cross-law propagation, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt48To50DeletedRange

/-- Membership in the deleted article range (48 through 50 inclusive). -/
def inDeletedRange (n : Nat) : Bool :=
  if n == 48 then true
  else if n == 49 then true
  else if n == 50 then true
  else false

/-- Lower bound article 48 is in the range. -/
theorem art_lo_deleted : inDeletedRange 48 = true := rfl

/-- Middle article 49 is in the range. -/
theorem art_mid_deleted : inDeletedRange 49 = true := rfl

/-- Upper bound article 50 is in the range. -/
theorem art_hi_deleted : inDeletedRange 50 = true := rfl

/-- Article one below the lower bound is not in the range. -/
theorem art_before_not_deleted : inDeletedRange 47 = false := rfl

/-- Article one above the upper bound is not in the range. -/
theorem art_after_not_deleted : inDeletedRange 51 = false := rfl

end JapanTaxLaw.LocalTaxArt48To50DeletedRange
