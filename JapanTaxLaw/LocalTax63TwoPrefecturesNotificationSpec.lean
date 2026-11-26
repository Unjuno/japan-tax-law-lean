import JapanTaxLaw.LocalTax63TwoPrefecturesNotification

/-
# LocalTax63TwoPrefecturesNotificationSpec — independent spec for 地方税法 Num 63(2)

Needle 「政府は、法人税に係る更正又は決定の通知をした場合には、遅滞なく、当該更正又は決定に係る所得の金額及び法人税額を当該更正又は決定に係る法人税額の課税標準の算定期間の末日における当該法人の事務所又は事業所（二以上の道府県において事務所又は事業所を有する法人にあつては、その主たる事務所又は事業所）所在地の道府県知事に通知しなければならない。」.
The implementation uses `threshold ≤ prefectures`; the independent spec states the same
inclusive bound as `2 ≤ prefectures`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax63TwoPrefecturesNotification

open JapanTaxLaw.TaxFinance

def specInScope (prefectures : Nat) : Prop := 2 ≤ prefectures

theorem agree_scope (prefectures : Nat) : inScope prefectures ↔ specInScope prefectures := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax63TwoPrefecturesNotification
