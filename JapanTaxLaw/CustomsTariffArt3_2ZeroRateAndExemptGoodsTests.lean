import JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoodsSpec

/-!
# CustomsTariffArt3_2ZeroRateAndExemptGoodsTests — kernel-checked checks

Verifies REFERENCE 「この法律その他関税に関する法律の規定により関税の率が無税とされている貨物及び関税が免除される貨物」: zero-rate/exempt in scope, other not.
-/

namespace JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods

example : inScope GoodClass.zeroRate := zero_rate_in_scope
example : inScope GoodClass.exempt := exempt_in_scope
example : ¬ inScope GoodClass.other := other_not_in_scope
example : inScope GoodClass.zeroRate ↔ SpecInScope GoodClass.zeroRate := scope_spec_agreement GoodClass.zeroRate
example : inScope GoodClass.other ↔ SpecInScope GoodClass.other := scope_spec_agreement GoodClass.other

end JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods
