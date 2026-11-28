import JapanTaxLaw.TaxFinance

/-
# LocalTax18FiveYearPrescription — pinned clause 「地方団体の徴収金の徴収を目的とする地方団体の権利（以下この款において「地方税の徴収権」という。）は、法定納期限（次の各号に掲げる地方団体の徴収金については、それぞれ当該各号に定める日）の翌日から起算して五年間行使しないことによつて、時効により消滅する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 18, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|b2ea03626a996a14d2dd2dd368d7e8a512068e368c0ff320345fbeee8db4b191.
原文逐語: 「地方団体の徴収金の徴収を目的とする地方団体の権利（以下この款において「地方税の徴収権」という。）は、法定納期限（次の各号に掲げる地方団体の徴収金については、それぞれ当該各号に定める日）の翌日から起算して五年間行使しないことによつて、時効により消滅する。」
Scope: ONLY the 地方税の徴収権の五年間不行使による時効消滅の INCLUSIVE 下限（years >= 5）. 法定納期限の算定・各号の特例・時効中断・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax18FiveYearPrescription

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (5) with the inclusive/strict boundary fixed by the clause. -/
def inScope (years : Nat) : Prop := years >= 5

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years >= 5)

end JapanTaxLaw.LocalTax18FiveYearPrescription
