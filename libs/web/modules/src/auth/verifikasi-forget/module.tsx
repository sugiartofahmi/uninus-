"use client";
import { FC, ReactElement, useState, useEffect, useRef } from "react";
import clsx from "clsx";
import { useVerify, useNewOtpRequest } from "./hook";
import { useRouter } from "next/navigation";
import OtpInput from "react-otp-input";
import { Button } from "@uninus/web/components";
import { useUserEmail } from "@uninus/web/services";

export const VerifForgetModule: FC = (): ReactElement => {
  const [isError, setIsError] = useState(false);
  const { mutate: verify } = useVerify();
  const { mutate: request } = useNewOtpRequest();
  const { getEmail } = useUserEmail();
  const [otp, setOtp] = useState<string>("");
  const { push } = useRouter();
  const [timer, setTimer] = useState(120);
  const intervalRef = useRef<any>();

  const countDownTimer = () => setTimer((prev) => prev - 1);
  useEffect(() => {
    intervalRef.current = setInterval(countDownTimer, 1000);
    return () => clearInterval(intervalRef.current);
  }, []);

  const handleSubmit = () => {
    if (otp.length === 6) {
      verify(
        {
          email: getEmail,
          otp,
        },
        {
          onSuccess: () => {
            push("/auth/reset-password");
          },
          onError: () => {
            setOtp("");
            setIsError(true);
          },
        },
      );
    } else {
      alert("Masukkan OTP yang valid (6 angka)");
    }
  };
  const inputStyle = clsx(
    "!w-full text-black border-2 border-grayscale-3 focus:outline-none outline-none placeholder:text-black placeholder:p-2 lg:!h-[64px] h-10 text-[28px] p-2 rounded-lg shadow-sm",
    {
      "border border-secodary-green-1 ": !isError,
      "border border-red-4 ": isError,
    },
  );
  const containerStyle = clsx("flex lg:gap-x-3 gap-x-1 justify-center w-full ");

  return (
    <form
      key="auth-verify"
      onSubmit={(e) => {
        e.preventDefault();
        handleSubmit();
      }}
      className="w-full h-full p-12 lg:px-12 lg:py-4 flex flex-col  justify-center items-center"
    >
      <div className="w-full flex flex-col gap-y-6 ">
        <span className="text-3xl font-bold text-primary-black font-bebasNeue w-30%">
          <h1>LUPA</h1>
          <span>PASSWORD?</span>
        </span>

        <p className="text-grayscale-5 lg:text-sm w-40%">
          {`Masukkan kode OTP yang sudah dikirimkan melalui email ${getEmail}`}
        </p>

        <div className="flex w-full">
          <OtpInput
            containerStyle={containerStyle}
            inputStyle={inputStyle}
            value={otp}
            onChange={setOtp}
            numInputs={6}
            shouldAutoFocus
            renderInput={(props) => <input {...props} />}
            inputType="tel"
          />
        </div>
        <div className="w-full">
          <Button type="submit" width="w-full">
            Atur Ulang Password
          </Button>
        </div>
        <div>
          <small>
            Belum menerima kode ?{" "}
            <span>
              <span className="text-secondary-green-1">
                {timer < 0 ? (
                  <span
                    onClick={() => {
                      setTimer(120);
                      request({ email: getEmail });
                    }}
                    ref={intervalRef}
                    className="text-secondary-green-1 hover:underline underline-offset-4 font-semibold cursor-pointer"
                  >
                    Kirim Ulang
                  </span>
                ) : (
                  timer
                )}
              </span>
            </span>
          </small>
        </div>
      </div>
    </form>
  );
};
