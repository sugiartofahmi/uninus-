'use client';
import { Button, TextField } from '@uninus/components';
import { FC, ReactElement } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { TVSRegister, VSRegister } from './schema';
import Link from 'next/link';
import { useRegister } from './hook';
import { useRouter } from 'next/navigation';

export const RegisterModule: FC = (): ReactElement => {
  const router = useRouter()
  const {
    control,
    handleSubmit,
    formState: { errors, isValid },
  } = useForm<TVSRegister>({
    mode: 'all',
    resolver: zodResolver(VSRegister),
    defaultValues: {
      email: '',
      password: '',
      nik: '',
      fullname: ""
    },
  });

  const { mutate, isLoading } = useRegister();

  const onSubmit = handleSubmit((data) => {
    mutate(
      {
        email: data?.email,
        password: data?.password,
        nik: data?.nik,
        fullname: data?.fullname,
      },
      {
        onSuccess: () => router.push('/auth/login'),
      }
    );
  });

  return (
    <form onSubmit={onSubmit} className="w-full h-full px-12 py-4 flex flex-col gap-y-3 items-between">
      <div className="w-full justify-start flex">
        <div className="flex flex-col justify-end ">
          <h1 className="font-bold text-[1.5rem]">Daftar Sekarang</h1>
          <p className="text-grayscale-5 w-[60vw] text-[12px] lg:text-[13px] lg:w-[30vw]">
            Mari bergabung!
          </p>
          <p className="text-grayscale-5 w-[60vw] text-[12px] lg:text-[13px] lg:w-[30vw]">
            Silahkan Lengkapi form dibawah untuk melanjutkan pendaftaran
          </p>
        </div>
      </div>
      <div className="h-auto w-full">
        <div className="grid gap-x-4 w-full grid-cols-2 grid-rows-2">
          <TextField
            name="fullname"
            type="text"
            variant="md"
            label="Nama Lengkap"
            placeholder="Masukan Nama Lengkap"
            control={control}
            required
            status={errors?.fullname ? 'error' : undefined}
            message={errors?.fullname?.message}
          />
          <TextField
            name="nik"
            type="text"
            variant="md"
            label="Namor Induk Keluarga"
            placeholder="Masukan Nomor Induk Keluarga"
            control={control}
            required
            status={errors?.nik ? 'error' : undefined}
            message={errors?.nik?.message}
          />
          <TextField
            name="email"
            type="email"
            variant="md"
            label="Email"
            placeholder="Masukan email"
            control={control}
            required
            status={errors?.email ? 'error' : undefined}
            message={errors?.email?.message}
          />
          <TextField
            name="password"
            type="password"
            variant="md"
            label="Kata Sandi"
            control={control}
            placeholder="Masukan Kata Sandi"
            required
            status={errors?.password ? 'error' : undefined}
            message={errors?.password?.message}
          />
        </div>
      </div>
      <div className="h-[33%] md:h-[36%] lg:h-[33%] flex flex-col gap-3 lg:mt-[0.5rem]">
        <div className="flex justify-center">
          <div className="w-full">
            <Button loading={isLoading} disabled={!isValid} width="w-full">
              Daftar Sekarang
            </Button>
          </div>
        </div>
        <div className="flex gap-2">
          <p className="text-grayscale-4 text-[12px]">Sudah memiliki akun ?</p>
          <Link href="/auth/login" className="text-primary-green text-[12px]">
            Login
          </Link>
        </div>
      </div>
    </form>
  );
};