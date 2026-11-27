import JapanTaxLaw.TaxFinance

/-
# LocalTax154PassengerCapacityAtLeast4 — pinned clause 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 154, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|94cf2cf2fe0288eb9b56efc4e21208d962ec20edf37d78ebd815e4dfc0878469.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」
Scope: ONLY the 最大乗車定員が四人以上である自動車 (passengers >= 4) INCLUSIVE lower bound for the 標準税率の加算. 前項第二号の区分・加算額の算出・他の乗車定員区分・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (4), INCLUSIVE lower bound. -/
def threshold : Nat := 4

/-- 「前項第二号に掲げる自動車のうち最大乗車定員が四人以上であるものに対して課する自動車税の標準税率は、同項（同号に係る部分に限る。）の規定にかかわらず、同号に定める額に、次の各号の区分に応じ当該各号に定める額を、それぞれ加算した額とする。」. -/
def inScope (passengers : Nat) : Prop := threshold ≤ passengers

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (passengers : Nat) : Bool := decide (4 ≤ passengers)

end JapanTaxLaw.LocalTax154PassengerCapacityAtLeast4
