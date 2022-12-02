create table if not exists outerdirections (
    id bigint not null
    constraint id primary key,
    patient_id intersect,
    1pu integer,
    d_numb varchar,
    service varchar,
    status varchar,
    reason varchar,
    represent_lpu varchar,
    represent_lpu_handle varchar,
    diagnosis_mkb integer,
    diagnosis_handle varchar,
    patient_date date,
    represent_doctor_fio varchar,
    doctor_handle varchar,
    hosp_date date,
    date_end date,
    to_doctor varchar,
    visit integer
    count_docs integer
);

DO
$$
BEGIN
drop type if exists ext_system_direction_type;
create type ext_system_outerdirections_type as (
    id bigint,
    patient_id intersect,
    1pu integer,
    d_numb varchar,
    service varchar,
    status varchar,
    reason varchar,
    represent_lpu varchar,
    represent_lpu_handle varchar,
    diagnosis_mkb integer,
    diagnosis_handle varchar,
    patient_date date,
    represent_doctor_fio varchar,
    doctor_handle varchar,
    hosp_date date,
    date_end date,
    to_doctor varchar,
    visit integer
    count_docs integer
    patient jsonb
    );
end;
$$;

DO
$$
BEGIN
drop type if exists ext_system_outerdirections _patient_type;
create type ext_system_outerdirections _patient_type as (
    id bigint,
    patient_id bigint,
    1pu bigint,
    d_numb varchar ,
    service varchar,
    status varchar,
    reason varchar,
    represent_1pu varchar,
    represent_1pu_handle varchar,
    diagnosis_mkb bigint,
    diagnosis_handle varchar,
    p_date date,
    represent_doctor_fio varchar,
    doctor_handle varchar;
    );
end;
$$;

drop function if exists f_ext_outerdirections8upd(id bigint,
                                            patient_id bigint,
                                            1pu bigint,
                                            d_numb varchar ,
                                            service varchar,
                                            status varchar,
                                            reason varchar,
                                            represent_1pu varchar,
                                            represent_1pu_handle varchar,
                                            diagnosis_mkb bigint,
                                            diagnosis_handle varchar,
                                            p_date date,
                                            represent_doctor_fio varchar,
                                            doctor_handle varchar;
    );
create function f_ext_outerdirections8upd(id bigint,
                                     patient_id bigint,
                                     1pu bigint,
                                     d_numb varchar ,
                                     service varchar,
                                     status varchar,
                                     reason varchar,
                                     represent_1pu varchar,
                                     represent_1pu_handle varchar,
                                     diagnosis_mkb bigint,
                                     diagnosis_handle varchar,
                                     p_date date,
                                     represent_doctor_fio varchar,
                                     doctor_handle varchar;
) returns integer
    security definer
    language plpgsql
as
$$
declare
n_id integer default null;
begin
begin
update outerdirections t
set (
        id,
        patient_id,
        1pu,
        d_numb,
        service,
        status,
        reason,
        represent_1pu,
        represent_1pu_handle,
        diagnosis_mkb,
        diagnosis_handle,
        p_date,
        represent_doctor_fio,
        doctor_handle;
        ) = (
              id,
                    patient_id,
                    1pu,
                    d_numb,
                    service,
                    status,
                    reason,
                    represent_1pu,
                    represent_1pu_handle,
                    diagnosis_mkb,
                    diagnosis_handle,
                    p_date,
                    represent_doctor_fio,
                    doctor_handle;


        )
where n_id = pn_id;
if not FOUND then

        else
            n_status := dn_status;
end if;
exception
        when others then n_status := null;
end;
return n_status;
end;
$$;

drop function if exists f_ext_outerdirections8add(  pn_id bigint,
                                                    pn_patient_id bigint,
                                                    pn_1pu bigint,
                                                    pn_d_numb varchar ,
                                                    pn_service varchar,
                                                    pn_status varchar,
                                                    pn_reason varchar,
                                                    pn_represent_1pu varchar,
                                                    pn_represent_1pu_handle varchar,
                                                    pn_diagnosis_mkb bigint,
                                                    pn_diagnosis_handle varchar,
                                                    pn_p_date date,
                                                    pn_represent_doctor_fio varchar,
                                                    pn_doctor_handle varchar;
    );
create function f_ext_outerdirections8add(pn_id bigint,
                                            pn_patient_id bigint,
                                            pn_1pu bigint,
                                            pn_d_numb varchar ,
                                            pn_service varchar,
                                            pn_status varchar,
                                            pn_reason varchar,
                                            pn_represent_1pu varchar,
                                            pn_represent_1pu_handle varchar,
                                            pn_diagnosis_mkb bigint,
                                            pn_diagnosis_handle varchar,
                                            pn_p_date date,
                                            pn_represent_doctor_fio varchar,
                                            pn_doctor_handle varchar;
) returns integer
    security definer
    language plpgsql
as
$$
DECLARE
n_id integer default null;
begin
begin
insert into outerdirections (id,
                             patient_id,
                             1pu,
                             d_numb,
                             service,
                             status,
                             reason,
                             represent_1pu,
                             represent_1pu_handle,
                             diagnosis_mkb,
                             diagnosis_handle,
                             p_date,
                             represent_doctor_fio,
                             doctor_handle;)
values substr(pn_id bigint,
                pn_patient_id,
                pn_1pu,
                pn_d_numb,
                pn_service,
                pn_status,
                pn_reason,
                pn_represent_1pu,
                pn_represent_1pu_handle,
                pn_diagnosis_mkb,
                pn_diagnosis_handle,
                pn_p_date,
                pn_represent_doctor_fio,
                pn_doctor_handle;
    returning id into n_id;

exception
        when others then n_id := null;
end;
return n_id;
end;
$$;

drop function if exists f_ext_8del(pn_id integer);
create function f_ext_outerdirections8del(pn_id integer) returns void
    security definer
    language plpgsql
as
$$
BEGIN
delete from outerdirections t where t.id = pn_id;
end;
$$;
