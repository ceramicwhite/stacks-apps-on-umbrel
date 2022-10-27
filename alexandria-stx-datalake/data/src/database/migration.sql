
-- CreateTable
CREATE TABLE public."transaction" (
	hash varchar NOT NULL,
	tx jsonb NOT NULL,
	processed bool NOT NULL DEFAULT false,
	missing bool NOT NULL DEFAULT false,
    /* JSONB generated columns */
	contract_id text NULL GENERATED ALWAYS AS ((tx -> 'contract_call'::text) ->> 'contract_id'::text) STORED,
	block_height int8 NULL GENERATED ALWAYS AS ((tx -> 'block_height'::text)::bigint) STORED,

	CONSTRAINT "transaction_pkey" PRIMARY KEY (hash)
);

CREATE TABLE public.block (
	hash varchar NOT NULL,
	height int8 NOT NULL,
	"timestamp" timestamp NOT NULL,
	block jsonb NOT NULL,

	CONSTRAINT "block_hash_pkey" PRIMARY KEY (hash),
	CONSTRAINT "block_height_ukey" UNIQUE (height)
);


/* Create indexes for jsonb generated colums */
CREATE INDEX transaction_block_height ON public.transaction USING btree (block_height);
CREATE INDEX transaction_contract_id ON public.transaction USING btree (contract_id);

/* Create function to notify upon block saved */
CREATE OR REPLACE FUNCTION public.notify_block()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
declare 
	begin 
		perform pg_notify( cast('new_block' as text), new.height::TEXT);
	    return null;
	end
$function$
;

/* Add trigger to notify events */
create trigger notify_blocks after
insert
    on
    public.block for each row execute function notify_block();