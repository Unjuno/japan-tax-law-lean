import JapanTaxLaw.TaxFinance

/-
# LocalTax321_7_4TwoAnnuityPaymentsDelegation — pinned clause 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 321_7_4, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|a4da9283f98a623368f304ac04defb7113c9a3cc034983bc981c243985158c9b.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:321_7_4/Article#321_7_4/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」
Scope: ONLY the 老齢等年金給付が二以上 (payments ≥ 2) lower bound. 前項の場合の認定, 政令で定めるところによる一の年金給付への徴収一元化の具体内容, 特別徴収対象年金給付の定義, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「前項の場合において、市町村は、同一の特別徴収対象年金所得者について老齢等年金給付が二以上あるときは、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について年金所得に係る特別徴収税額を徴収させるものとする。」. -/
def inScope (payments : Nat) : Prop := threshold ≤ payments

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (payments : Nat) : Bool := decide (2 ≤ payments)

end JapanTaxLaw.LocalTax321_7_4TwoAnnuityPaymentsDelegation
