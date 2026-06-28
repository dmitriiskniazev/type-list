import std;

import type_list;

struct Fst;
struct Snd;

using List = type_list::from_pack_t<Fst, Snd>;
using Reversed = type_list::reverse_t<List>;

static_assert(type_list::size_v<List> == 2);
static_assert(type_list::size_v<Reversed> == 2);
static_assert(std::same_as<type_list::front_t<Reversed>, Snd>);

auto main() -> int {
    return 0;
}
