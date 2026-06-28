import std;

import type_list;

struct Fst;
struct Snd;
struct Trd;
struct Frh;

using Left = type_list::from_pack_t<Fst, Snd>;
using Right = type_list::from_pack_t<Trd, Frh>;
using Zipped = type_list::zip_t<Left, Right>;
using Concatenated = type_list::concat_t<Left, Right>;
using Reversed = type_list::reverse_t<Concatenated>;

static_assert(type_list::size_v<Zipped> == 2);
static_assert(std::same_as<type_list::front_t<Zipped>, std::pair<Fst, Trd>>);
static_assert(type_list::size_v<Concatenated> == 4);
static_assert(std::same_as<type_list::front_t<Reversed>, Frh>);
static_assert(std::same_as<type_list::back_t<Reversed>, Fst>);

auto main() -> int {
    return 0;
}
