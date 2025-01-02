/*
 * SPDX-License-Identifier: Apache-2.0
 *
 * Copyright 2020-2025 The JReleaser authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.jreleaser.infra.nativeimage.processor;

import org.kordamp.jipsy.annotations.ServiceProviderFor;

import javax.annotation.processing.ProcessingEnvironment;
import javax.annotation.processing.Processor;
import javax.annotation.processing.SupportedAnnotationTypes;
import javax.annotation.processing.SupportedOptions;

/**
 * @author Andres Almiray
 * @since 1.0.0
 */
@SupportedOptions({Constants.OPTION_PROJECT_PATH,
    ReflectConfigGenerator.OPTION_DISABLE
})
@ServiceProviderFor(Processor.class)
@SupportedAnnotationTypes({"org.jreleaser.infra.nativeimage.annotations.NativeImage"})
public class ReflectConfigProcessor extends AbstractCompositeGeneratorProcessor {
    @Override
    public synchronized void init(ProcessingEnvironment processingEnv) {
        super.init(processingEnv);
        generators.add(new ReflectConfigGenerator());
    }
}
