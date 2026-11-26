import JapanTaxLaw.BankHeadOfficeTermReading

/-
# BankHeadOfficeTermReadingSpec — independent spec for 電子情報処理組織特例省令 第十一条

Declared statutory scope:
  Law id: 403M50000040054, revision 403M50000040054_20260924_508M60000040059
  Article: 第十一条 第四項 — only the 読替え 「日本銀行統轄店」→「所轄歳入取りまとめ店」.

The implementation uses a structural match on the first Nat constructor.
This spec transcribes the same substitution independently with a propositional
equality test (`if c = 0 then 1 else c`): a different operator, with no
implementation definition reused in any `spec*` def. The universal agreement
theorem is proved by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: the triggering case, 第六項's content, other articles, and
human legal determination.
-/

namespace JapanTaxLaw.BankHeadOfficeTermReading

/-- Independent transcription: 日本銀行統轄店 is read as 所轄歳入取りまとめ店. -/
def specReadAs (c : Nat) : Nat :=
  if c = 0 then 1 else c

/-- Universal, axiom-free kernel correspondence for every term code. -/
theorem agree_read_as (c : Nat) : readAs c = specReadAs c := by
  cases c <;> rfl

end JapanTaxLaw.BankHeadOfficeTermReading
