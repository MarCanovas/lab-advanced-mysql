use publications;

select au_id, (advance + royalty) as profit
from (
		select ta.au_id, t.title_id, 
		sum(t.advance * ta.royaltyper / 100) as advance,
		(t.price * s.qty * t.royalty * ta.royaltyper / 10000) as royalty

		from titles as t 
		join titleauthor as ta on t.title_id = ta.title_id 
		join sales as s on ta.title_id = s.title_id

		group by ta.au_id, t.title_id
        ) t

order by profit desc;